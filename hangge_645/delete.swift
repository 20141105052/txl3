import UIKit

class delete: UIViewController {
    var db:SQLiteDB!
    
    
    
    
    @IBOutlet weak var text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20),address varchar(20),email varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    

    
    @IBAction func shanchu(sender: AnyObject) {
        del()
    }
    
    
    

    func del(){
        let a=text.text!
        let sql = "delete from user where uname='\(a)'"
        let result = db.execute(sql)
        print(result)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //保存数据到SQLite
    
    
}