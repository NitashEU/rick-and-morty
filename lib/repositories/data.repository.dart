import 'package:get/get.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/models/episode.model.dart';
import 'package:rick_and_morty/models/location-extended.model.dart';
import 'package:rick_and_morty/models/paginated-result.model.dart';

class DataRepository {
  final _characterBaseUrl = 'https://rickandmortyapi.com/api/character';
  final _locationBaseUrl = 'https://rickandmortyapi.com/api/location';
  final _episodeBaseUrl = 'https://rickandmortyapi.com/api/episode';

  Future<List<Character>> getAllCharacters() async {
    PaginatedResult<Character> paginatedResult;
    final characters = <Character>[];
    do {
      paginatedResult = (await GetConnect().get<PaginatedResult<Character>>(
        paginatedResult == null ? _characterBaseUrl : paginatedResult.info.next,
        decoder: (pr) => PaginatedResult.fromJson(pr, (c) => Character.fromJson(c)),
      ))
          .body;
      characters.addAll(paginatedResult.results);
    } while (paginatedResult.info.next != null);
    return characters;
  }

  Future<List<LocationExtended>> getAllLocations() async {
    PaginatedResult<LocationExtended> paginatedResult;
    final locations = <LocationExtended>[];
    do {
      paginatedResult = (await GetConnect().get<PaginatedResult<LocationExtended>>(
        paginatedResult == null ? _locationBaseUrl : paginatedResult.info.next,
        decoder: (pr) => PaginatedResult.fromJson(pr, (c) => LocationExtended.fromJson(c)),
      ))
          .body;
      locations.addAll(paginatedResult.results);
    } while (paginatedResult.info.next != null);
    return locations;
  }

  Future<List<Episode>> getAllEpisodes() async {
    PaginatedResult<Episode> paginatedResult;
    final episodes = <Episode>[];
    do {
      paginatedResult = (await GetConnect().get<PaginatedResult<Episode>>(
        paginatedResult == null ? _episodeBaseUrl : paginatedResult.info.next,
        decoder: (pr) => PaginatedResult.fromJson(pr, (c) => Episode.fromJson(c)),
      ))
          .body;
      episodes.addAll(paginatedResult.results);
    } while (paginatedResult.info.next != null);
    return episodes;
  }

  // This one is a future in case we change this to another API later on.
  Future<List<String>> getQuotes() async {
    return [
      '"Wubba Lubba Dub Dub!” — Rick',
      '"What, so everyone’s supposed to sleep every single night now? You realize that nighttime makes up half of all time?” — Rick',
      '"Boom! Big reveal! I turned myself into a pickle!” — Rick',
      '"Nobody exists on purpose. Nobody belongs anywhere. We’re all going to die. Come watch TV.” — Morty',
      '"To live is to risk it all; otherwise you’re just an inert chunk of randomly assembled molecules drifting wherever the universe blows you.” — Rick',
      '"Weddings are basically funerals with a cake.” — Rick',
      '"I’ll tell you how I feel about school, Jerry: It’s a waste of time. Bunch of people runnin’ around bumpin’ into each other, got a guy up front says, ‘Two plus two,’ and the people in the back say, ‘Four.’ Then the bell rings and they give you a carton of milk and a piece of paper that says you can go take a dump or somethin’. I mean, it’s not a place for smart people, Jerry. I know that’s not a popular opinion, but that’s my two cents on the issue.” — Rick',
      '"Sometimes science is more art than science.” — Rick',
      '"If I let you make me nervous, then we can’t get schwifty.” — Rick',
      '"Listen, Morty, I hate to break it to you, but what people call ‘love’ is just a chemical reaction that compels animals to breed.” — Rick',
      '"Don’t move. Gonorrhea can’t see us if we don’t move. Wait! I was wrong! I was thinking of a T. rex.” — Rick',
      '"Have fun with empowerment. It seems to make everyone that gets it really happy.” — Rick',
      '"Listen, I’m not the nicest guy in the universe, because I’m the smartest, and being nice is something stupid people do to hedge their bets.” — Rick',
      '"I know that new situations can be intimidating. You’re lookin’ around and it’s all scary and different, but y’know, meeting them head-on, charging into ‘em like a bull — that’s how we grow as people.” — Rick',
      '"You gotta do it for Grandpa, Morty. You gotta put these seeds inside your butt.” — Rick',
      '"Morty, I need your help on an adventure. Eh, ‘need’ is a strong word. We need door stops, but a brick would work too.” — Rick',
      '"I’m a scientist; because I invent, transform, create, and destroy for a living, and when I don’t like something about the world, I change it.” — Pickle Rick',
      '"He’s not a hot girl. He can’t just bail on his life and set up shop in someone else’s.” — Beth',
      '"Honey, stop raising your father’s cholesterol so you can take a hot funeral selfie.” — Beth',
      '"So what if he’s the devil, Rick? At least the devil has a job. At least he’s active in the community.” — Summer',
      '"Unity, I’m sorry. I didn’t know freedom meant people doing stuff that sucks. I was thinking more of a ‘choose your own cellphone carrier’ thing.” — Summer',
      '"Thanks, Mr. Poopybutthole. I always could count on you.” — Rick',
      '"Excuse me. Coming through. What are you here for? Just kidding, I don’t care.” — Rick',
      '"So I have an emo streak. It’s part of what makes me so rad.” — Rick',
      '"I just want to go back to hell, where everyone thinks I’m smart and funny.” — Mr. Needful',
      '"Don’t deify the people who leave you.” — Beth',
      '"If I die in a cage, I lose a bet.” — Rick',
      '"Yeah, sure, I mean, if you spend all day shuffling words around, you can make anything sound bad, Morty.” — Rick',
      '"Don’t get drawn into the culture, Morty. Stealing stuff is about the stuff, not the stealing.” — Rick',
      '"Your parents are a bag of dicks.” — Rick',
      '"I’m sorry, but your opinion means very little to me.” — Rick',
      '"Hi Mr. Jellybean, I’m Morty. I’m on an adventure with my grandpa.” — Morty',
      '"B*tch, my generation gets traumatized for breakfast!” — Summer',
      '"You’re the little brother. You’re not the cause of your parents’ misery, you’re just a symptom of it.” — Summer',
      '"Having a family doesn’t mean that you stop being an individual. You know the best thing you can do for the people that depend on you? Be honest with them, even if it means setting them free.” — Mr. Meeseeks',
      '"Well then get your shit together, get it all together and put it in a backpack, all your shit, so it’s together. And if you gotta take it somewhere, take it somewhere, you know. Take it to the shit store and sell it, or put it in the shit museum. I don’t care what you do, you just gotta get it together. Get your shit together.” — Morty',
    ];
  }
}
