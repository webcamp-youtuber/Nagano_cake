class Config::Initializers::TimeFormat < ApplicationRecord
  
  Time::DATE_FORMATS[:datetime_jp] = '%Y年 %m月 %d日 %H時 %M分' 
  
end
