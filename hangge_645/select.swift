import UIKit

class select: UIViewController {
    var db:SQLiteDB!
    
    

    
    

    @IBOutlet weak var text12: UITextView!
    @IBOutlet weak var text11: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20),address varchar(20),email varchar(20))")
        //如果有数据则加载
        //initUser()
    }

    @IBAction func zhao(sender: AnyObject) {
        cha()
    }
    

    func  cha(){
        text12.text=""
        let a=text11.text!
        let data = db.query("select * from t_user where uname='\(a)'")
        for (var i=0;i<data.count;i++)
        {
            let tuser=data[i]
            text12.text! += "用户名：" + String(tuser["uname"]!) + " 手机：" + String(tuser["mobile"]!) + "地址：" + String(tuser["address"]!) + "邮箱：" + String(tuser["email"]!)

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}


}