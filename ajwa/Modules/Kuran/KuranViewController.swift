
import UIKit

protocol KuranDisplayLogic: AnyObject {
    func displayKuran(viewModel: [Kuran.ModelType.ViewModel])
}

final class KuranViewController: UIViewController, KuranDisplayLogic {
    
    var interactor: KuranBusinessLogic?
    var router: (NSObjectProtocol & KuranRoutingLogic & KuranDataPassing)?
    var kurans = [Kuran.ModelType.ViewModel]()
    var filteredKurans = [Kuran.ModelType.ViewModel]()
    var isFiltered = false
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(KuranCell.self, forCellReuseIdentifier: KuranCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = UIColor.secondarySystemGroupedBackground
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
        KuranConfigurator.shared.configure(viewController: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        KuranConfigurator.shared.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Куран"
        getKuranData()
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
            make.height.equalTo(70)
        }
        
        searchBar.searchTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(52)
            make.width.equalTo(350)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func getKuranData() {
        interactor?.getKuranList()
    }
    
    func displayKuran(viewModel: [Kuran.ModelType.ViewModel]) {
        kurans.append(contentsOf: viewModel)
        filteredKurans = kurans
        tableView.reloadData()
    }
}

extension KuranViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredKurans = kurans
        } else {
            filteredKurans = []
            for kuran in kurans {
                if kuran.title.lowercased().contains(searchText.lowercased()) || kuran.description.lowercased().contains(searchText.lowercased()) {
                    filteredKurans.append(kuran)
                }
            }
        }
        tableView.reloadData()
    }
}
