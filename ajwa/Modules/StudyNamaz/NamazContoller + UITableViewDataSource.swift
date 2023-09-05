
import UIKit

extension NamazViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredPrayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NamazCell.identifier, for: indexPath) as? NamazCell else { return UITableViewCell() }
        
        cell.configure(with: filteredPrayers[indexPath.row])
        cell.selectionStyle = .none
        cell.accessoryType = .none
        cell.backgroundColor = UIColor.systemGroupedBackground
        return cell
    }
}

