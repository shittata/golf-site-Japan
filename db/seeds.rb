# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
GolfCourse.destroy_all
ActiveRecord::Base.connection.execute("UPDATE sqlite_sequence SET seq = 0 WHERE name = 'golf_courses'")

puts " seeding start ".center(50, "=")

# --- データベースに保存するゴルフ場リスト ---
courses_data = [
  # --- 名門カテゴリのゴルフ場 ---
  { name: "利府ゴルフ倶楽部", area: "宮城郡利府町", description: "JLPGAツアー開催地として知られる、戦略性と美しさを兼ね備えた東北屈指の名門コース。", tags: "名門", image_url: "rifu.jpg", official_url: "#" },
  { name: "表蔵王国際ゴルフ倶楽部", area: "柴田郡柴田町", description: "蔵王連峰を望む雄大なロケーション。緻密なコースマネジメントが求められる本格派コース。", tags: "名門", image_url: "omotezao.jpg", official_url: "#" },

  # --- 格安カテゴリのゴルフ場 ---
  { name: "仙台グリーンゴルフ", area: "仙台市太白区", description: "河川敷に広がるフラットなコース。リーズナブルな価格設定で、気軽にプレーを楽しめる。", tags: "格安", image_url: "sendai_green.jpg", official_url: "#" },
  { name: "富谷パブリックコース", area: "富谷市", description: "初心者からアベレージゴルファーまで幅広く楽しめるパブリックコース。練習施設も充実。", tags: "格安", image_url: "tomiya_public.jpg", official_url: "#" },

  # --- 難コースカテゴリのゴルフ場 ---
  { name: "杜の都ゴルフ倶楽部", area: "黒川郡大和町", description: "自然の地形を巧みに活かしたアンジュレーション豊かなフェアウェイとグリーンが特徴の難関コース。", tags: "難コース", image_url: "morinomiyako.jpg", official_url: "#" },
  { name: "仙台南ゴルフ倶楽部", area: "名取市", description: "距離が長く、巧みに配置されたハザードが行く手を阻む。挑戦意欲を掻き立てられるコース。", tags: "難コース", image_url: "sendai_minami.jpg", official_url: "#" },

  # --- 易コース（初心者向け）カテゴリのゴルフ場 ---
  { name: "仙塩ゴルフ倶楽部 浦霞コース", area: "塩竈市", description: "距離が比較的短く、フェアウェイも広め。海を望む美しい景色の中でリラックスしてプレーできる。", tags: "易コース", image_url: "senshio.jpg", official_url: "#" },
  { name: "仙台ヒルズゴルフ倶楽部", area: "仙台市泉区", description: "市街地からのアクセスも良好。適度なアップダウンと変化に富んだホールが楽しめる。", tags: "易コース", image_url: "sendai_hills.jpg", official_url: "#" },

  # --- 複数のカテゴリに属するゴルフ場 ---
  { name: "仙台クラシックゴルフ倶楽部", area: "黒川郡富谷町", description: "歴史と風格を感じさせるクラブハウスと、戦略性に富んだコースレイアウトが魅力。", tags: "名門, 難コース", image_url: "sendai_classic.jpg", official_url: "#" },
  { name: "松島チサンカントリークラブ", area: "黒川郡大郷町", description: "45ホールを有する大規模コース。大郷コースはフラットで初心者にも優しい設計。", tags: "格安, 易コース", image_url: "matsushima_chisan.jpg", official_url: "#" }
]

GolfCourse.create!(courses_data)

puts " seeding end ".center(50, "=")
puts "#{GolfCourse.count}件のゴルフ場データを作成しました。"
