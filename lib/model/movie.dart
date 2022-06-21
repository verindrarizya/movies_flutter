

class Movie {
  String title;
  String poster;
  int year;
  double rating;
  String duration;
  List<String> genre;
  String director;
  String description;

  Movie({
    required this.title,
    required this.poster,
    required this.year,
    required this.rating,
    required this.duration,
    required this.genre,
    required this.director,
    required this.description
  });
}

final List<Movie> movies = [
  Movie(
    title: "Pulp Fiction",
    poster: "images/pulp-fiction.jpg",
    year: 1994,
    rating: 8.9,
    duration: "2h 34m",
    genre: ["Crime", "Drama"],
    director: "Quentin Tarantino",
    description: "Jules Winnfield and Vincent Vega are two hit men who are out to retrieve a suitcase stolen from their employer, mob boss Marsellus Wallace. Wallace has also asked Vincent to take his wife Mia out a few days later when Wallace himself will be out of town. Butch Coolidge is an aging boxer who is paid by Wallace to lose his fight. The lives of these seemingly unrelated people are woven together comprising of a series of funny, bizarre and uncalled-for incidents."
  ),
  Movie(
    title: "Forrest Gump",
    poster: "images/forrest-gump.jpg",
    year: 1994,
    rating: 8.8,
    duration: "2h 22m",
    genre: ["Drama", "Romance"],
    director: "Robert Zemeckis",
    description: "Forrest Gump is a simple man with a low I.Q. but good intentions. He is running through childhood with his best and only friend Jenny. His 'mama' teaches him the ways of life and leaves him to choose his destiny. Forrest joins the army for service in Vietnam, finding new friends called Dan and Bubba, he wins medals, creates a famous shrimp fishing fleet, inspires people to jog, starts a ping-pong craze, creates the smiley, writes bumper stickers and songs, donates to people and meets the president several times. However, this is all irrelevant to Forrest who can only think of his childhood sweetheart Jenny Curran, who has messed up her life. Although in the end all he wants to prove is that anyone can love anyone."
  ),
  Movie(
    title: "Fight Club",
    poster: "images/fight-club.jpg",
    year: 1999,
    rating: 8.8,
    duration: "2h 19m",
    genre: ["Drama"],
    director: "David Fincher",
    description: "A nameless first person narrator attends support groups in attempt to subdue his emotional state and relieve his insomniac state. When he meets Marla, another fake attendee of support groups, his life seems to become a little more bearable. However when he associates himself with Tyler he is dragged into an underground fight club and soap making scheme. Together the two men spiral out of control and engage in competitive rivalry for love and power."
  ),
  Movie(
    title: "Inception",
    poster: "images/inception.jpg",
    year: 2010,
    rating: 8.8,
    duration: "2h 28m",
    genre: ["Action", "Adventure", "Sci-fi"],
    director: "Christopher Nolan",
    description: "Dom Cobb is a skilled thief, the absolute best in the dangerous art of extraction, stealing valuable secrets from deep within the subconscious during the dream state, when the mind is at its most vulnerable. Cobb's rare ability has made him a coveted player in this treacherous new world of corporate espionage, but it has also made him an international fugitive and cost him everything he has ever loved. Now Cobb is being offered a chance at redemption. One last job could give him his life back but only if he can accomplish the impossible, inception. Instead of the perfect heist, Cobb and his team of specialists have to pull off the reverse: their task is not to steal an idea, but to plant one. If they succeed, it could be the perfect crime. But no amount of careful planning or expertise can prepare the team for the dangerous enemy that seems to predict their every move. An enemy that only Cobb could have seen coming."
  ),
  Movie(
    title: "Your Name",
    poster: "images/your-name.jpg",
    year: 2016,
    rating: 8.6,
    duration: "1h 46m",
    genre: ["Animation", "Drama", "Fantasy"],
    director: "Makoto Shinkai",
    description: "Mitsuha is the daughter of the mayor of a small mountain town. She's a straightforward high school girl who lives with her sister and her grandmother and has no qualms about letting it be known that she's uninterested in Shinto rituals or helping her father's electoral campaign. Instead she dreams of leaving the boring town and trying her luck in Tokyo. Taki is a high school boy in Tokyo who works part-time in an Italian restaurant and aspires to become an architect or an artist. Every night he has a strange dream where he becomes...a high school girl in a small mountain town."
  )
];