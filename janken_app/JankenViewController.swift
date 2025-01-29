import UIKit

class JankenViewController: UIViewController {
    // タイトルラベル
    @IBOutlet weak var titleLabel: UILabel!
    // スタートボタン
    @IBOutlet weak var startButton: UIButton!
    // 相手の手
    @IBOutlet weak var opponentHandLabel: UILabel!
    // 自分の手
    @IBOutlet weak var selfHandLabel: UILabel!
    // じゃんけんの手（ボタン）
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    
    // 結果表示用ラベル
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // 表示制御対象の要素配列初期値
    var elemsDisp: [UIView] = []
    // ボタンの初期位置保存用の変数
    var titleOriginalPosition: CGPoint!
    var startOriginalPosition: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 表示制御対象の要素配列
        elemsDisp = [opponentHandLabel, selfHandLabel, resultLabel, rockButton, scissorsButton, paperButton]
        
        // 初期位置を保存
        titleOriginalPosition = titleLabel.frame.origin
        startOriginalPosition = startButton.frame.origin
        
        // 初期表示を設定
        generateView()
    }
    
    /// 画面の初期の状態を設定
    func generateView() {
        titleLabel.text = JankenContants.titleText
        startButton.setTitle(JankenContants.startBtnLabel, for: .normal)
        opponentHandLabel.text = JankenContants.labelOrigin
        selfHandLabel.text = JankenContants.labelOrigin
        rockButton.setTitle(JankenContants.rockLabel, for: .normal)
        scissorsButton.setTitle(JankenContants.scissorsLabel, for: .normal)
        paperButton.setTitle(JankenContants.paperLabel, for: .normal)
        
        // 初期表示時の対象要素非表示
        for elem in elemsDisp {
            elem.isHidden = true
        }
    }
    
    /// スタート・終了ボタンのタップ時処理
    /// - Parameter sender: startButton（タップされたボタン）
    @IBAction func clickStartButton(_ sender: Any) {
        if startButton.currentTitle == JankenContants.startBtnLabel { // スタートボタン
            // 非表示にしていた要素を表示
            for elem in elemsDisp {
                elem.isHidden = false
            }
            // 結果リセット
            resultLabel.text = ""
            opponentHandLabel.text = JankenContants.labelOrigin
            selfHandLabel.text = JankenContants.labelOrigin
            
            // ボタンを「終了」に変更
            startButton.setTitle(JankenContants.endBtnLabel, for: .normal)
            
            // ボタンの位置を変更
            UIView.animate(withDuration: 0.3) {
                self.startButton.frame.origin = CGPoint(x: 0, y: 100)
            }
        } else { // 終了ボタン
            // 要素非表示
            for elem in elemsDisp {
                elem.isHidden = true
            }
            
            // ボタンを「スタート」に変更
            startButton.setTitle(JankenContants.startBtnLabel, for: .normal)
            
            // ボタンを初期位置に戻す
            UIView.animate(withDuration: 0.3) {
                self.startButton.frame.origin = self.startOriginalPosition
            }
        }
    }
    
    /// じゃんけんの手を選択したときの処理
    /// - Parameter sender: グー・チョキ・パーのボタン（自分の手）
    @IBAction func cllickSelfHands(_ sender: Any) {
        // 相手の手をランダム表示
        opponentHandLabel.text = JankenContants.hands.randomElement()
        
        if let button = sender as? UIButton {
            // 自分の選んだ手を表示
            selfHandLabel.text = button.currentTitle
            
            // 勝敗の判定、表示
            switch (selfHandLabel.text, opponentHandLabel.text) {
            case (JankenContants.rockLabel, JankenContants.scissorsLabel), (JankenContants.scissorsLabel, JankenContants.paperLabel), (JankenContants.paperLabel, JankenContants.rockLabel):
                resultLabel.text = "あなたの勝ち!"
            case (JankenContants.scissorsLabel, JankenContants.rockLabel), (JankenContants.paperLabel, JankenContants.scissorsLabel), (JankenContants.rockLabel, JankenContants.paperLabel):
                resultLabel.text = "あなたの負け!"
            default:
                resultLabel.text = "引き分け!"
            }
        }
    }
}
