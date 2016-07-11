import UIKit

class sedelete: UIViewController {
    var db:SQLiteDB!
    
    
    
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists guo(uid integer primary key,uname varchar(20),mobile varchar(20),address varchar(20),email varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    

    @IBAction func shan(sender: AnyObject) {
        shan()
    }
    
    func  shan(){
        text4.text=""
        let a=text3.text!
        let data = db.query("delete * from guo where uname='\(a)'")
        for (var i=0;i<data.count;i++)
        {
            let tuser=data[i]
            text4.text! += "用户名：" + String(tuser["uname"]!) + " 手机：" + String(tuser["mobile"]!) + "地址：" + String(tuser["address"]!) + "邮箱：" + String(tuser["email"]!)
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}