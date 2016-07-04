import UIKit

class File: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet var txtUname: UITextField!
    @IBOutlet var txtMobile: UITextField!
    
    @IBOutlet weak var ddddd: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        initUser()
    }
    

    

    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        for var i=1;i<data.count;i++
        {
            var user=data[i]
            x.text! +="\(i)"
            x.text!+="用户名：" +String(user["uname"]!)+"电话："+String(user["Mobile"]!)
        }
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            txtUname.text = user["uname"] as? String
            txtMobile.text = user["mobile"] as? String
        }
    }
    

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}