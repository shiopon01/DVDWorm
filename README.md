## DVDWorm
持ってるDVDを管理できます。DVD用に作っただけで、本でもなんでもいいです。
 
### テーブル
dvds(id INT(11), title VARCHAR(45), title_kana VARCHAR(45), category_id INT(11), created_at TIMESTAMP)  
categories(id INT(11), category VARCHAR(15))  
actors(id INT(11), name VARCHAR(45), name_kana VARCHAR(45))  
dvd_actors(dvd_id INT(11), actor_id INT(11))  
