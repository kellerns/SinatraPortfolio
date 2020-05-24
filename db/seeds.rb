10.times do
  user = User.create(name: Faker::TvShows::SouthPark.character, email: Faker::Internet.email)
  2.times do
    user.teams.create(
    name: Faker::TvShows::Seinfeld.business,
    league: Faker::Movies::HarryPotter.house,
    quarterback: Faker::TvShows::GameOfThrones.character,
    running_back_one: Faker::Sports::Football.player,
    wide_reciever_one: Faker::Sports::Basketball.player,
    running_back_two: Faker::Sports::Football.player,
    wide_reciever_two: Faker::Sports::Basketball.player,
    tight_end: Faker::Movies::LordOfTheRings.character,
    kicker: Faker::Movies::StarWars.character,
    defense: Faker::Sports::Basketball.team,
    wins: Faker::Number.within(range: 1..5),
    losses: Faker::Number.within(range: 1..5)
    )
  end
end
