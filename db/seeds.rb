# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Prefecture.upsert_all(
    [
      { code: 100, name: "Hokkaido" },
      { code: 210, name: "Aomori" },
      { code: 220, name: "Akita" },
      { code: 230, name: "Yamagata" },
      { code: 240, name: "Niigata" },
      { code: 310, name: "Iwate" },
      { code: 320, name: "Miyagi" },
      { code: 330, name: "Fukushima" },
      { code: 410, name: "Gumma" },
      { code: 420, name: "Tochigi" },
      { code: 430, name: "Saitama" },
      { code: 440, name: "Ibaraki" },
      { code: 510, name: "Chiba" },
      { code: 520, name: "Tokyo" },
      { code: 530, name: "Kanagawa" },
      { code: 610, name: "Gifu" },
      { code: 620, name: "Nagano" },
      { code: 630, name: "Yamanashi" },
      { code: 640, name: "Shizuoka" },
      { code: 650, name: "Aichi" },
      { code: 660, name: "Mie" },
      { code: 710, name: "Toyama" },
      { code: 720, name: "Ishikawa" },
      { code: 730, name: "Fukui" },
      { code: 810, name: "Hyogo" },
      { code: 820, name: "Kyoto" },
      { code: 830, name: "Shiga" },
      { code: 840, name: "Osaka" },
      { code: 850, name: "Nara" },
      { code: 860, name: "Wakayama" },
      { code: 910, name: "Tottori" },
      { code: 920, name: "Okayama" },
      { code: 930, name: "Hiroshima" },
      { code: 940, name: "Shimane" },
      { code: 950, name: "Yamaguchi" },
      { code: 1010, name: "Kagawa" },
      { code: 1020, name: "Tokushima" },
      { code: 1030, name: "Ehime" },
      { code: 1040, name: "Kochi" },
      { code: 100, name: "Hokkaido" },
      { code: 1110, name: "Fukuoka" },
      { code: 1120, name: "Saga" },
      { code: 1130, name: "Nagasaki" },
      { code: 1140, name: "Kumamoto" },
      { code: 1150, name: "Oita" },
      { code: 1160, name: "Miyazaki" },
      { code: 1170, name: "Kagoshima" },
      { code: 1200, name: "Okinawa" },
    ]
  )