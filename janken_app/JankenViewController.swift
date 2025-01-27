import UIKit

class JankenViewController: UIViewController {
    //タイトルラベル
    @IBOutlet weak var titleLabel: UILabel!
    
    // 相手の手
    @IBOutlet weak var opponentHandLabel: UILabel!
    
    // 自分の手
    @IBOutlet weak var selfHandLabel: UILabel!
    
    // グー
    @IBOutlet weak var rockButton: UIButton!
    // チョキ
    @IBOutlet weak var scissorsButton: UIButton!
    // パー
    @IBOutlet weak var paperButton: UIButton!
    
    
    let titleText = "じゃんけん"
    let hands = ["👊","✌️","✋"]
//    let opponentHand: String = hands.randomElement()
    let rockLabel = "グー👊"
    let scissorsLabel = "チョキ✌️"
    let paperLabel = "パー✋"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aaa")
        generateView()
    }

    func generateView() {
        titleLabel.text = titleText
        rockButton.setTitle(rockLabel, for:UIControl.State.normal)
        scissorsButton.setTitle(scissorsLabel, for:UIControl.State.normal)
        paperButton.setTitle(paperLabel, for:UIControl.State.normal)
    }
    
    @IBAction func clickRockButton(_ sender: Any) {
        opponentHandLabel.text = hands.randomElement()
    }
    
}

