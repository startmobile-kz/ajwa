
import UIKit

extension KuranViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredKurans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KuranCell.identifier, for: indexPath) as? KuranCell else { return UITableViewCell() }
        
        cell.configure(with: filteredKurans[indexPath.row])
        cell.selectionStyle = .none
        cell.accessoryType = .none
        cell.backgroundColor = UIColor.systemGroupedBackground
        return cell
    }
}

