import UIKit

class JankenViewController: UIViewController {
    //タイトルラベル
    @IBOutlet weak var titleLabel: UILabel!
    // スタートボタン
    @IBOutlet weak var startButton: UIButton!
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
    let opponentLabel = "？"
    let startBtnLabel = "スタート"
    let endBtnLabel = "終了"
    let hands = ["👊","✌️","✋"]
    var elemsDisp: [UIView] = []
    let rockLabel = "グー👊"
    let scissorsLabel = "チョキ✌️"
    let paperLabel = "パー✋"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elemsDisp = [selfHandLabel,rockButton,scissorsButton,paperButton]
        generateView()
    }

    func generateView() {
        titleLabel.text = titleText
        startButton.setTitle(startBtnLabel, for:UIControl.State.normal)
        opponentHandLabel.text = opponentLabel
        rockButton.setTitle(rockLabel, for:UIControl.State.normal)
        scissorsButton.setTitle(scissorsLabel, for:UIControl.State.normal)
        paperButton.setTitle(paperLabel, for:UIControl.State.normal)
        for elem in elemsDisp {
            elem.isHidden = true
        }
    }
    
    @IBAction func clickStartButton(_ sender: Any) {
        if startButton.currentTitle == startBtnLabel {
            for elem in elemsDisp {
                elem.isHidden = false
            }
            startButton.setTitle(endBtnLabel, for:UIControl.State.normal)
        }else{
            for elem in elemsDisp {
                elem.isHidden = true
            }
            startButton.setTitle(startBtnLabel, for:UIControl.State.normal)
        }
        
    }
    
}

