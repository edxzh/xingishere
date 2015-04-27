# encoding : utf-8
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', comment: '用户表' do |t|
      t.string  :username,            limit: 20,                                          comment: "用户名"
      t.string  :name,                limit: 20,    null: false, default: "星哥粉丝",     comment: "姓名"
      t.string  :password_digest,                                                         comment: "加密后的密码"
      t.string  :sex,                 limit: 20,                                          comment: "性别"
      t.string  :email,               limit: 50,    null: false,                          comment: "邮箱"
      t.date    :birthday,                          null: false, default: "1970-01-01",   comment: "生日"
      t.integer :status,                            null: false, default: 0,              comment: "婚姻情况"
      t.integer :height,                                                                  comment: "身高"
      t.string  :position,            limit: 50,                                          comment: "职业"
      t.string  :address,             limit: 50,                                          comment: "地址"
      t.integer :relation,                          null: false,  default: 0,             comment: "与博主关系"
      t.string  :image,                                                                   comment: "头像"
      t.integer :rights,                            null: false, default: "2",            comment: "权限"
      t.integer :score,                             null: false, default: 0,              comment: "积分"
      t.text    :description,         limit: 100,                                         comment: "个人描述"
      t.boolean :admin,                                                                   comment: "是否为管理员"
      t.string  :activate_code,       limit: 65,                                          comment: "激活校验码"
      t.boolean :activate_status,                   null: false,  default: false,         comment: "激活状态"
      t.timestamps

    end
    add_index :users, :email, unique: true
  end
end
