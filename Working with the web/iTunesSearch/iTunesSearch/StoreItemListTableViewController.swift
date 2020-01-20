
import UIKit

class StoreItemListTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    let storeItemController = StoreItemController()
    
    
    // add item controller property
    
    var items: [StoreItem] = []
    
    let queryOptions = ["movie", "music", "software", "ebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchTerm.isEmpty {
            
            // set up query dictionary
            let query: [String: String] = [
                "term" : searchTerm,
                "media" : mediaType
            ]
            // use the item controller to fetch items
            storeItemController.fetchItems(matching: query) { (fetchedItems) in
                if let items = fetchedItems {
                    self.items = items
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else {
                    print("어떤 에러")
                }
                // if successful, use the main queue to set self.items and reload the table view
                // otherwise, print an error to the console
            }
        }
    }
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.name
        // set label to the item's name
        cell.detailTextLabel?.text = item.artist
        // set detail label to the item's subtitle
        // reset the image view to the gray image
        
        let task = URLSession.shared.dataTask(with: item.artworkURL) { (data, response, error) in
            guard let data = data,
                let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                cell.imageView?.image = image
            }
            
        }
        task.resume()
        // initialize a network task to fetch the item's artwork
        // if successful, use the main queue capture the cell, to initialize a UIImage, and set the cell's image view's image to the
        // resume the task
        
    }
    
    @IBAction func filterOptionUpdated(_ sender: UISegmentedControl) {
        
        fetchMatchingItems()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension StoreItemListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}

