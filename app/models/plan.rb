class Plan < ApplicationRecord
  validates :user_id,         presence: true
  validates :marriage,        presence: true
  validates :when_marriage,   presence: true
  validates :wedding,         presence: true
  validates :sons,            presence: true
  validates :when_first_son,  presence: true
  validates :when_last_son,   presence: true
  validates :myhome,          presence: true
  validates :when_myhome,     presence: true
  validates :birth_year,      presence: true
  validates :retirement_year, presence: true
  validates :saving,          presence: true
  validates :severance,       presence: true
  
  enum marriage:{
    "---":9999,
    "する":1, "しない":2, "既婚":3,"わからない":0,
  }, _prefix: true
  
  enum when_marriage:{
    "---":9999,
    "20代前半(20~24歳)":0,
    "20代後半(25~29歳)":10,
    "30代前半(30~34歳)":20,
    "30代後半(35~39歳)":30,
    "40代前半(40~44歳)":40,
    "40代後半(45~49歳)":50,
    "50代前半(50~54歳)":60,
    "50代後半(55~59歳)":70,
    "60代前半(60~64歳)":80,
    "60代後半以降(65歳~)":90
  }, _prefix: true
  
  enum wedding:{
    "---":9999,
    "する":1, "しない":2, "わからない":0, 
  }, _prefix: true
  
  enum sons:{
    "---":9999,
    "1人":1,"2人":2,"3人":3,"4人":4,"5人":5,"6人":6,
    "ほしくない":0,
    "わからない":7
  } ,_prefix: true
  
  enum when_first_son:{
    "---":9999,
    "20代前半(20~24歳)":0,
    "20代後半(25~29歳)":10,
    "30代前半(30~34歳)":20,
    "30代後半(35~39歳)":30,
    "40代前半(40~44歳)":40,
    "40代後半(45~49歳)":50,
    "50代前半(50~54歳)":60,
    "50代後半(55~59歳)":70,
    "60代前半(60~64歳)":80,
    "60代後半以降(65歳~)":90
  } ,_prefix: true
  
  enum when_last_son:{
    "---":9999,
    "20代前半(20~24歳)":0,
    "20代後半(25~29歳)":10,
    "30代前半(30~34歳)":20,
    "30代後半(35~39歳)":30,
    "40代前半(40~44歳)":40,
    "40代後半(45~49歳)":50,
    "50代前半(50~54歳)":60,
    "50代後半(55~59歳)":70,
    "60代前半(60~64歳)":80,
    "60代後半以降(65歳~)":90
  } ,_prefix: true
  
  enum myhome:{
    "---":9999,
    "購入する":1, "購入予定はない":2, "わからない":0,
  } ,_prefix: true
  
  enum when_myhome:{
    "---":9999,
    "20代前半(20~24歳)":0,
    "20代後半(25~29歳)":10,
    "30代前半(30~34歳)":20,
    "30代後半(35~39歳)":30,
    "40代前半(40~44歳)":40,
    "40代後半(45~49歳)":50,
    "50代前半(50~54歳)":60,
    "50代後半(55~59歳)":70,
    "60代前半(60~64歳)":80,
    "60代後半以降(65歳~)":90
  } ,_prefix: true
  
  enum birth_year:{
    "---":9999,
    "1990年":1990,
    "1991年":1991,
    "1992年":1992,
    "1993年":1993,
    "1994年":1994,
    "1995年":1995,
    "1996年":1996,
    "1997年":1997,
    "1998年":1998,
    "1999年":1999,
    "2000年":2000
  } ,_prefix: true
end
