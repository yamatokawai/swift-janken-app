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
    var titleOriginalPosition: CGPoint!
    var startOriginalPosition: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elemsDisp = [opponentHandLabel, selfHandLabel,rockButton,scissorsButton,paperButton]
        titleOriginalPosition = titleLabel.frame.origin
        startOriginalPosition = startButton.frame.origin
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
    
    func getRandomHand() {
        opponentHandLabel.text = hands.randomElement()
    }
    
    @IBAction func clickStartButton(_ sender: Any) {
        if startButton.currentTitle == startBtnLabel {
            for elem in elemsDisp {
                elem.isHidden = false
            }
            startButton.setTitle(endBtnLabel, for:UIControl.State.normal)
            UIView.animate(withDuration: 0.3) {
                        self.startButton.frame.origin = CGPoint(x: 50, y: 100)
                    }
        }else{
            for elem in elemsDisp {
                elem.isHidden = true
            }
            startButton.setTitle(startBtnLabel, for:UIControl.State.normal)
            UIView.animate(withDuration: 0.3) {
                self.startButton.frame.origin = self.startOriginalPosition
            }
        }
    }
    @IBAction func selectSelfHand(_ sender: Any) {
        getRandomHand()
    }
    
}

