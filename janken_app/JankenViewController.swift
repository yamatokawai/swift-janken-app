import UIKit

class JankenViewController: UIViewController {
    //タイトルラベル
    @IBOutlet weak var titleLabel: UILabel!
    // 相手の手
    @IBOutlet weak var opponentHandImg: UIImageView!
    // 自分の手
    @IBOutlet weak var selfHandImg: UIImageView!
    // グー
    @IBOutlet weak var rockButton: UIButton!
    // チョキ
    @IBOutlet weak var scissorsButton: UIButton!
    // パー
    @IBOutlet weak var paperButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

