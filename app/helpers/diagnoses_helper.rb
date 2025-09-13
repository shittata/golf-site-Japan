module DiagnosesHelper
  RECOMMENDED_MIYAGI = {
    shops_general: [
      { name: "GOLF5 仙台泉店", url: "https://store.alpen-group.jp/store_search/detail.php?shopid=2755", note: "総合/試打" },
      { name: "PGA TOUR Superstore 仙台泉店（インドア/フィッティング）", url: "https://maps.app.goo.gl/HqS7shTDdqhqG7x48", note: "大型/インドア" },
      { name: "つるやゴルフ 仙台店", url: "https://www.tsuruyagolf.co.jp/stores/kanto/700", note: "総合/工房" },
      { name: "本間ゴルフ 仙台店", url: "https://www.honmagolf.com/jp/ja/stores/details/sendai", note: "ブランド直営/フィッティング" }
    ],
    shops_used: [
      { name: "ゴルフパートナー 仙台泉バイパス店", url: "https://www.golfpartner.co.jp/971/", note: "中古/買取" },
      { name: "ゴルフパートナー 仙台六丁の目店", url: "https://www.golfpartner.co.jp/928/", note: "中古/買取" }
    ],
    indoor_only: [
      { name: "PGA TOUR Superstore 仙台泉店（インドア）", url: "https://maps.app.goo.gl/HqS7shTDdqhqG7x48", note: "個室/シミュレーター" }
    ],
    courses_beginner: [
      { name: "松島チサンカントリークラブ 大郷コース（PGM）", url: "https://reserve.golfdigest.co.jp/course-guide/area/04/ranking/course-beginner-low.asp", note: "初心者向けランキング掲載" },
      { name: "宮城野ゴルフクラブ（アコーディア）", url: "https://reserve.golfdigest.co.jp/course-guide/area/04/ranking/course-beginner-low.asp", note: "GPSナビ/初心者安心" },
      { name: "松島国際カントリークラブ", url: "https://reserve.golfdigest.co.jp/golf-course/236101/", note: "口コミ良好" }
    ],
    courses_premium: [
      { name: "利府ゴルフ倶楽部", url: "https://booking.gora.golf.rakuten.co.jp/guide/disp/c_id/40033/", note: "名門/高評価" },
      { name: "表蔵王国際ゴルフクラブ", url: "https://reserve.golfdigest.co.jp/golf-course/230501/comment/", note: "歴史/整備良" }
    ],
    online: [
      { name: "GOLF5 公式オンラインストア", url: "https://store.alpen-group.jp/golf5/" },
      { name: "GDO ゴルフショップ", url: "https://www.golfdigest.co.jp/" },
      { name: "つるやゴルフ ONLINE", url: "https://www.tsuruyagolf.co.jp/online/" },
      { name: "本間ゴルフ 公式オンライン", url: "https://www.honmagolf-ec.com/" }
    ]
  }.freeze

  # 診断結果（@diagnosis）に応じて候補を返す
  def recommendations_for(diagnosis)
    price = diagnosis.question1 # "1"=コスパ重視, "2"=価格二の次
    practice = diagnosis.question3 # "1"=オープン, "2"=クローズ（個室）

    shops =
      if price == "1"
        RECOMMENDED_MIYAGI[:shops_used] + RECOMMENDED_MIYAGI[:shops_general]
      else
        RECOMMENDED_MIYAGI[:shops_general] + [{ name: "本間ゴルフ 仙台店（直営）", url: "https://www.honmagolf.com/jp/ja/stores/details/sendai", note: "プレミアム" }]
      end

    courses =
      if price == "1"
        RECOMMENDED_MIYAGI[:courses_beginner]
      else
        RECOMMENDED_MIYAGI[:courses_beginner] + RECOMMENDED_MIYAGI[:courses_premium]
      end

    indoor =
      practice == "2" ? RECOMMENDED_MIYAGI[:indoor_only] : []

    {
      shops: shops.uniq { |h| h[:name] },
      courses: courses.uniq { |h| h[:name] },
      indoor: indoor,
      online: RECOMMENDED_MIYAGI[:online]
    }
  end
end
