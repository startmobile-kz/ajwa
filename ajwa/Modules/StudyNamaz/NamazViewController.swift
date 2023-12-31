
import UIKit

protocol NamazDisplayLogic: AnyObject {
    func displayPrayer(viewModel: [Namaz.ModelType.ViewModel])
}

final class NamazViewController: UIViewController, NamazDisplayLogic {
    
    var interactor: NamazBusinessLogic?
    var router: (NSObjectProtocol & NamazRoutingLogic & NamazDataPassing)?
    var prayers = [Namaz.ModelType.ViewModel]()
    var filteredPrayers = [Namaz.ModelType.ViewModel]()
    var isFiltered = false
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(NamazCell.self, forCellReuseIdentifier: NamazCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = UIColor.systemGroupedBackground
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.systemGroupedBackground.cgColor
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "Поиск"
        let image = UIImage(named: "search")
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.borderStyle = .none
        searchBar.searchTextField.layer.cornerRadius = 15
        searchBar.searchTextField.clearButtonMode = .always
        searchBar.searchTextField.leftViewMode = .never
        searchBar.showsBookmarkButton = true
        searchBar.setImage(image, for: .bookmark, state: .normal)
        searchBar.delegate = self
        return searchBar
    }()
    
    
    // MARK: View lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NamazConfigurator.shared.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NamazConfigurator.shared.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Обучение намазу"
        getPrayerData()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
        }
        
        searchBar.searchTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(52)
            make.width.equalTo(350)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: Do something
    
    
    func getPrayerData() {
        interactor?.getNamazList()
    }
    
    func displayPrayer(viewModel: [Namaz.ModelType.ViewModel]) {
        prayers.append(contentsOf: viewModel)
        filteredPrayers = prayers
        tableView.reloadData()
    }
}

extension NamazViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredPrayers = prayers
        } else {
            filteredPrayers = []
            for prayer in prayers {
                if prayer.title.lowercased().contains(searchText.lowercased()) || prayer.description.lowercased().contains(searchText.lowercased()) {
                    filteredPrayers.append(prayer)
                }
            }
        }
        tableView.reloadData()
    }
}
