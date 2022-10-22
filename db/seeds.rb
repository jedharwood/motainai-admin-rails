# Prefectures
Prefecture.upsert_all(
  [
    { code: 100, name: "Hokkaido" },
    { code: 210, name: "Aomori" },
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
akita = Prefecture.create(code: 220, name: "Akita")
tokyo = Prefecture.create(code: 520, name: "Tokyo")
kanagawa = Prefecture.create(code: 530, name: "Kanagawa")

# Cities
City.create(prefecture_id: akita.id, name: "Yokote", rating: 3.5)
City.create(prefecture_id: tokyo.id, name: "Koenji", rating: 2.5)
City.create(prefecture_id: tokyo.id, name: "Shibuya", rating: 1.5)
City.create(prefecture_id: kanagawa.id, name: "Yokohama", rating: 5)
City.create(prefecture_id: kanagawa.id, name: "Zushi", rating: 4)
City.create(prefecture_id: kanagawa.id, name: "Fujisawa", rating: 0)

# Users
def create_user_and_update_profile(idx, first_name = nil, last_name = nil)
  user = User.create(email: "admin#{idx}@motainai.co.jp", password: "password")
  profile = Profile.find_by!(user_id: user.id)
  profile.update({ :approved => true, :first_name => first_name, :last_name => last_name })
end

create_user_and_update_profile(1, "Jack", "Burton")
create_user_and_update_profile(2, "Anne")
create_user_and_update_profile(3, nil, "Burns")
create_user_and_update_profile(4)
(5..7).each { |idx|
  User.create(email: "admin#{idx}@motainai.co.jp", password: "password")
}
