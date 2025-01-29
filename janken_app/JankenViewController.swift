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
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let titleText = "じゃんけん"
    let labelOrigin = "？"
    let startBtnLabel = "スタート"
    let endBtnLabel = "終了"
    let hands = ["👊","✌️","✋"]
    var elemsDisp: [UIView] = []
    let rockLabel = "👊"
    let scissorsLabel = "✌️"
    let paperLabel = "✋"
    var titleOriginalPosition: CGPoint!
    var startOriginalPosition: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        elemsDisp = [opponentHandLabel, selfHandLabel,resultLabel,rockButton,scissorsButton,paperButton]
        titleOriginalPosition = titleLabel.frame.origin
        startOriginalPosition = startButton.frame.origin
        generateView()
    }

    
    func generateView() {
        titleLabel.text = titleText
        startButton.setTitle(startBtnLabel, for:UIControl.State.normal)
        opponentHandLabel.text = labelOrigin
        selfHandLabel.text = labelOrigin
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
            resultLabel.text = ""
            opponentHandLabel.text = labelOrigin
            selfHandLabel.text = labelOrigin
            startButton.setTitle(endBtnLabel, for:UIControl.State.normal)
            UIView.animate(withDuration: 0.3) {
                        self.startButton.frame.origin = CGPoint(x: 0, y: 100)
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
    
    @IBAction func cllickSelfHands(_ sender: Any) {
        opponentHandLabel.text = hands.randomElement()
        
        if let button = sender as? UIButton {
            selfHandLabel.text = button.currentTitle
            switch (selfHandLabel.text, opponentHandLabel.text ) {
            case ( rockLabel, scissorsLabel), (scissorsLabel, paperLabel), (paperLabel, rockLabel):
                resultLabel.text = "あなたの勝ち!"
            case (scissorsLabel, rockLabel), (paperLabel, scissorsLabel), (rockLabel, paperLabel):
                resultLabel.text = "あなたの負け!"
            default:
                resultLabel.text = "引き分け!"
            }
        }
        
    }
    
}

