
devise(admin)	

    GET     /admins/sign_in	  admin/sessions	new	管理者ログイン画面	devise利用

    POST	/admins/sign_in	  admin/sessions	create	管理者ログイン	devise利用

    DELETE	/admins/sign_out  admin/sessions	destroy	管理者ログアウト	devise利用
order	

    GET	  /admins  admin/orders	  top	注文履歴一覧画面【管理者用トップページ】	必要事項：購入日時・購入者名前【会員名前】・注文個数・受注ステータス・各ページ遷移リンク
product	

    GET     /admin/products/new	   admin/products new    商品新規登録画面、必要項目：商品画像・商品名・商品説明・ジャンル選択・価格・販売ステータス・新規登録ボタン

    GET	/admins/products	   admin/products index	 商品一覧画面【管理者側】必要項目：新規登録画面遷移ボタン・商品ID・商品名・税込価格・ジャンル・ステータス・各No.ページ遷移リンク

    GET	/admins/products/:id	   admin/products show	 商品詳細画面【管理者側】必要項目：商品画像・商品説明・ジャンル・価格・販売ステータス・編集ページリンク遷移ボタン

    GET	/admins/products/:id/edit  admin/products edit	 商品編集画面、必要項目：商品画像・商品名・商品説明・ジャンル選択・価格・販売ステータス・変更保存ボタン


    POST	/admins/products	   admin/products create 商品新規登録、商品新規登録ボタン

    PUT	/admins/products/:id	   admin/products update 商品編集更新、商品編集内容更新ボタン
genre

    GET	/admins/genres	　　　　　　　　　　　　　　　　admin/genres	index	ジャンル一覧・ジャンル登録を表示する	必要項目：新規登録機能【ジャンル名・新規登録ボタン】・ジャンル一覧と各ジャンルの編集画面リンク遷移ボタン

    GET	/admins/genres/:id/edit	admin/genres	edit	ジャンル編集画面	必要項目：ジャンル名・変更保存ボタン

    POST	/admins/genres	　　　　　　　　　　　　　　　　admin/genres	create	ジャンル新規登録	ジャンル新規登録ボタン

    PUT	/admins/genres/:id	admin/genres	update	ジャンル編集更新	ジャンル編集内容更新ボタン
custemer

    GET	/admins/custemers	admin/custemers	index	会員一覧画面	必要項目：会員ID・氏名・メールアドレス・ステータス・各ページ遷移リンク

    GET	/admins/custemers/:id	admin/custemers	show	会員詳細画面	必要事項：会員ID・氏名・ふりがな・郵便番号・住所・電話番号・メールアドレス・会員ステータス・会員情報編集ページリンクボタン・注文履歴遷移リンクボタン【会員側注文履歴一覧】

    GET	/admins/custemers/edit	admin/custemers	edit	会員編集画面	必要事項：会員ID・氏名・ふりがな・郵便番号・住所・電話番号・メールアドレス・会員ステータス【有効or退会選択】・変更保存ボタン

    PUT	/admins/custemers/:id	admin/custemers	update	会員編集更新	会員編集内容更新ボタン
order

    GET	/admins/orders/:id	admin/orders	show	注文履歴詳細	"必要事項：購入者・注文日・配送先・支払い方法・受注ステータス【選択&更新ボタン】・注文内容【商品名・価格・数量・小計・制作ステータス&各更新ボタン】　商品合計・送料・請求金額合計"
						
    PUT	/admins/orders/:id	admin/orders	update	会員注文履歴詳細更新【受注ステータス用】	注文履歴詳細内容　更新ボタン用【受注ステータス用】
order_detail

    PUT	/admins/order_details/:id	admin/order_details	update	制作ステータス更新	会員注文履歴詳細　更新ボタン用【制作ステータス用】
						
●顧客側

devise

    GET	/customers/sign_up	registrations	new	新規登録画面表示	必要項目：氏名、カナ、メールアドレス、郵便番号、住所、電話番号、パスワード、パスワード確認用、新規登録ボタン、ログイン遷移リンク

    POST	/customers	　　　　　　　　　　　　　　　　registrations	create	新規登録	新規登録ボタン

    GET	/customers/sign_up	sessions	index	ログイン画面表示	必要事項:メールアドレス、パスワード、ログインボタン、　　新規登録遷移リンク

    POST	/customers/sign_in	sessions	create	ユーザログイン	ログイン機能

    DELETE	/customers/sign_out	sessions	destroy	ユーザログアウト	ログアウト機能

    GET	/	　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　homes	　　　　　　　　　　　　　　　　top	アプリケーションtopページ	必要項目：ジャンル検索サイドバー・サイト概要説明・新着商品・全商品一覧画面リンク

    GET	/about	　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　homes	　　　　　　　　　　　　　　　　about	アプリケーションaboutページ	必要項目：サイト概要説明
product

    GET 　　　　　　　　/products	products	index	商品一覧画面【購入者側】	必要事項：ジャンル検索用サイドバー・各種商品&商品名&価格・各No.ページ遷移リンク

    GET	/products/:id	products	show	商品詳細【購入者側】	必要事項：ジャンル検索用サイドバー・商品名&商品説明&商品画像&価格・必要個数選択プルダウンボタン・カートリンク遷移ボタン
cart_item	

    GET	/cart_items	cart_items	index	カート内商品一覧	必要事項：【カート内】商品名、単価、数量（数量変更ボタン）、小計、削除ボタン、全削除ボタン、注文続行ボタン、注文手続き遷移ボタン

    PUT	/cart_items/:id	cart_items	update	カート内数量変更時の更新	必要事項：数量変更更新ボタン

    POST	/cart_items	cart_items	create	商品追加	カートに商品を追加、保存

    DELETE	/cart_items/:id	cart_items	destroy	一つ一つの商品削除	必要事項：商品削除ボタン

    DELETE	/cart_items	cart_items	all_destroy	全ての商品を削除	必要事項：カートを空にする
order

    GET	/orders/new	　　orders	new	　　注文情報入力画面	必要項目：支払い方法・お届け先【ご自身の住所or登録先から選択or新しいお届け先】・確認画面遷移リンクボタン

    GET	/orders/confirm	　　orders	confirm	　　注文情報確認画面	必要項目：商品名、商品単価（税込）、数量、小計、お届け先（住所、郵便番号、宛名）、支払方法、請求金額（送料＋商品合計）

    POST	/orders	　　　　　　　　　　　　　　　　　　orders	create	　　注文情報確定	注文確定機能

    GET	/orders/complate　　orders	complate　　注文完了画面	必要項目：確定及び感謝文(ご注文ありがとうございました！)

    GET	/orders	　　　　　　　　　　　　　　　　　　orders	index	　　注文履歴一覧	必要項目：注文日、配送先、注文商品、支払い金額、ステータス、注文詳細表示ボタン、＊if文でログイン分岐させ管理者用一覧画面記述

    GET	/orders/:id	　　orders	show	　　注文履歴詳細	必要項目：注文情報（注文日・配送先・支払方法・ステータス）、請求情報（商品合計・配送料・ご請求金額）、注文内容（商品・税込単価・個数・小計）
"customer【ルーティングはresource】"

    GET	/customers	　　　　　　　　　　　　　　　　customers	show	会員マイページを表示する	必要項目：会員情報（氏名、カナ、郵便番号、住所、電話番号、メールアドレス）、編集ボタン、配送先一覧ボタン、注文履歴一覧遷移リンクボタン

    PATCH	/customers	　　　　　　　　　　　　　　　　customers	update	会員の登録情報更新	編集内容の保存

    GET	/customers/unsubscribe	customers	unsubscribe	会員退会画面	必要項目：退会確認ボタン（いいえ、はい）

    PUT	/customers/withdraw	customers	withdraw	会員退会完了	退会実行

    GET	/customers/edit	　　　　　　　　　　　　　　　　customers	edit	会員編集画面を表示する	必要項目：氏名、カナ、郵便番号、住所、電話番号、メールアドレス、編集内容保存ボタン、退会ボタン
address	

    GET	/addresses	addresses	index	配送先登録/一覧画面を表示する	必要項目：郵便番号（ハイフンなし）、住所、宛名、新規登録ボタン、配送先一覧（編集・削除ボタン）

    POST	/addresses	addresses	create	配送先新規登録	新規登録ボタン

    DELETE	/addresses/:id	addresses	destroy	配送先削除	削除ボタン

    GET	/addresses/:id/edit　　addresses	edit	配送先編集画面を表示する	必要項目：配送先編集（郵便番号（ハイフンなし）、住所、宛名、）編集内容保存ボタン

    PATCH	/addresses/:id	addresses	update	配送先の登録情報更新	登録情報更新ボタン
