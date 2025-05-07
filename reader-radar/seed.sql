-- Seed data for the database in dev

-- Insert users
INSERT INTO users (username, password) VALUES
('rose', 'badwolf'),
('martha', 'freedom'),
('donna', 'noble123');


-- Insert names
INSERT INTO names (user_id, first_name, last_name) VALUES
(1, 'Rose', 'Tyler'),
(2, 'Martha', 'Jones'),
(3, 'Donna', 'Noble');

-- Insert relationships
INSERT INTO relationships (follower_id, followed_id) VALUES
(1, 2),
(2, 3),
(3, 1);

-- Insert books
INSERT INTO books (title, author, isbn, page_length, external_ratings, synopsis) VALUES
("The Time Traveler's Wife", "Audrey Niffenegger", 9781931561464, 546, 4.0, "This is the extraordinary love story of Clare and Henry, who met when Clare was six and Henry was thirty-six, and were married when Clare was twenty-two and Henry was thirty. Impossible but true, because Henry suffers from a rare condition where his genetic clock periodically resets and he finds himself pulled suddenly into his past or future. In the face of this force they can neither prevent nor control, Henry and Clare’s struggle to lead normal lives is both intensely moving and entirely unforgettable."),
("The Hitchhiker's Guide to the Galaxy", "Douglas Adams", 9780345418913, 224, 4.38, "Seconds before the Earth is demolished to make way for a galactic freeway, Arthur Dent is plucked off the planet by his friend Ford Prefect, a researcher for the revised edition of The Hitchhiker's Guide to the Galaxy who, for the last fifteen years, has been posing as an out-of-work actor."),
("The Martian", "Andy Weir", 9780804139021, 384, 4.42, "Six days ago, astronaut Mark Watney became one of the first people to walk on Mars. Now, he’s sure he’ll be the first person to die there. After a dust storm nearly kills him and forces his crew to evacuate while thinking him dead, Mark finds himself stranded and completely alone with no way to even signal Earth that he’s alive—and even if he could get word out, his supplies would be gone long before a rescue could arrive. Chances are, though, he won’t have time to starve to death. The damaged machinery, unforgiving environment, or plain-old “human error” are much more likely to kill him first. But Mark isn’t ready to give up yet. Drawing on his ingenuity, his engineering skills—and a relentless, dogged refusal to quit—he steadfastly confronts one seemingly insurmountable obstacle after the next. Will his resourcefulness be enough to overcome the impossible odds against him?"),
("Dune", "Frank Herbert", 9780593099322, 658, 4.28, "Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the “spice” melange, a drug capable of extending life and enhancing consciousness. Coveted across the known universe, melange is a prize worth killing for..."),
("Kafka on the Shore", "Haruki Murakami", 9781400079278, 467, 4.12, "Kafka on the Shore, a tour de force of metaphysical reality, is powered by two remarkable characters: a teenage boy, Kafka Tamura, who runs away from home either to escape a gruesome oedipal prophecy or to search for his long-missing mother and sister; and an aging simpleton called Nakata, who never recovered from a wartime affliction and now is drawn toward Kafka for reasons that, like the most basic activities of daily life, he cannot fathom. Their odyssey, as mysterious to them as it is to us, is enriched throughout by vivid accomplices and mesmerizing events. Cats and people carry on conversations, a ghostlike pimp employs a Hegel-quoting prostitute, a forest harbors soldiers apparently unaged since World War II, and rainstorms of fish (and worse) fall from the sky. There is a brutal murder, with the identity of both victim and perpetrator a riddle—yet this, along with everything else, is eventually answered, just as the entwined destinies of Kafka and Nakata are gradually revealed, with one escaping his fate entirely and the other given a fresh start on his own."),
("Normal People", "Sally Rooney", 9781984822185, 304, 3.81, "Connell Waldron is one of the most popular boys in his small-town high school--he is a star of the football team and an excellent student, and he is never wanting for attention from girls. The one thing he doesn't have is money. Marianne Sheridan, a classmate of Connell's, has the opposite problem. Marianne is plain-looking, odd, and stubborn, and while her family is quite well off, she has no friends to speak of. There is, however, a deep and undeniable connection between the two teenagers, one that develops into a secret relationship. Everything changes when both Connell and Marianne are accepted to Trinity College. Suddenly Marianne is well liked and elegant, holding court with her intellectual friends, while Connell hangs at the sidelines, not quite as fluent in the language of the elite. Throughout their years at university, Marianne and Connell circle each other, falling in and out of romance but never straying far from where they started. And as Marianne experiments with an increasingly dangerous string of boyfriends, Connell must decide how far he is willing to go to save his oldest friend. Sally Rooney brings her brilliant psychological acuity and perfectly spare prose to a novel that explores the subtleties of class, the electricity of first love, and the inescapable challenges of family and friendships. Normal People is a book that you will read in one sitting, and then immediately jump up to share with your friends."),
("Beloved", "Toni Morrison", 9781400033416, 325, 3.97, "Sethe, its protagonist, was born a slave and escaped to Ohio, but eighteen years later she is still not free. She has too many memories of Sweet Home, the beautiful farm where so many hideous things happened. And Sethe's new home is haunted by the ghost of her baby, who died nameless and whose tombstone is engraved with a single word: Beloved. Filled with bitter poetry and suspense as taut as a rope, Beloved is a towering achievement by Nobel Prize laureate Toni Morrison."),
("The Crying of Lot 49", "Thomas Pynchon", 9780060913076, 152, 3.69, "Suffused with rich satire, chaotic brilliance, verbal turbulence and wild humor, The Crying of Lot 49 opens as Oedipa Maas discovers that she has been made executrix of a former lover's estate. The performance of her duties sets her on a strange trail of detection, in which bizarre characters crowd in to help or confuse her. But gradually, death, drugs, madness, and marriage combine to leave Oedipa in isolation on the threshold of revelation, awaiting the Crying of Lot 49."),
("The Bluest Eye", "Toni Morrison", 9780307278449, 206, 4.5, "In Morrison’s acclaimed first novel, Pecola Breedlove—an 11-year-old Black girl in an America whose love for its blond, blue-eyed children can devastate all others—prays for her eyes to turn blue: so that she will be beautiful, so that people will look at her, so that her world will be different. This is the story of the nightmare at the heart of her yearning, and the tragedy of its fulfillment."),
("The Wind-Up Bird Chronicle", "Haruki Murakami", 9780965341981, 607, 4.14, "In a Tokyo suburb a young man named Toru Okada searches for his wife's missing cat. Soon he finds himself looking for his wife as well in a netherworld that lies beneath the placid surface of Tokyo. As these searches intersect, Okada encounters a bizarre group of allies and antagonists: a psychic prostitute; a malevolent yet mediagenic politician; a cheerfully morbid sixteen-year-old-girl; and an aging war veteran who has been permanently changed by the hideous things he witnessed during Japan's forgotten campaign in Manchuria."),
("The Bell Jar", "Sylvia Plath", 9780061148514, 288, 4.3, "The Bell Jar chronicles the crack-up of Esther Greenwood: brilliant, beautiful, enormously talented, and successful, but slowly going under—maybe for the last time. Sylvia Plath masterfully draws the reader into Esther’s breakdown with such intensity that Esther’s neurosis becomes completely real and even rational, as probable and accessible an experience as going to the movies. Such deep penetration into the dark and harrowing corners of the psyche is an extraordinary accomplishment and has made The Bell Jar an enduring classic."),
("Gone Girl", "Gillian Flynn", 9780307588371, 422, 4.1, "On a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne’s fifth wedding anniversary. Presents are being wrapped and reservations are being made when Nick’s clever and beautiful wife disappears. Husband-of-the-Year Nick isn’t doing himself any favors with cringe-worthy daydreams about the slope and shape of his wife’s head, but passages from Amy's diary reveal the alpha-girl perfectionist could have put anyone dangerously on edge. Under mounting pressure from the police and the media—as well as Amy’s fiercely doting parents—the town golden boy parades an endless series of lies, deceits, and inappropriate behavior. Nick is oddly evasive, and he’s definitely bitter—but is he really a killer?"),
("The Year of Magical Thinking", "Joan Didion", 9781400078431, 227, 4.4, "Several days before Christmas 2003, John Gregory Dunne and Joan Didion saw their only daughter, Quintana, fall ill with what seemed at first flu, then pneumonia, then complete septic shock. She was put into an induced coma and placed on life support. Days later—the night before New Year’s Eve—the Dunnes were just sitting down to dinner after visiting the hospital when John Gregory Dunne suffered a massive and fatal coronary. In a second, this close, symbiotic partnership of forty years was over. Four weeks later, their daughter pulled through. Two months after that, arriving at LAX, she collapsed and underwent six hours of brain surgery at UCLA Medical Center to relieve a massive hematoma."),
("Weapons of Math Destruction: How Big Data Increases Inequality and Threatens Democracy", "Cathy O'Neil", 9780553418828, 254, 3.88, "We live in the age of the algorithm. Increasingly, the decisions that affect our lives—where we go to school, whether we can get a job or a loan, how much we pay for health insurance—are being made not by humans, but by machines. In theory, this should lead to greater Everyone is judged according to the same rules. But as mathematician and data scientist Cathy O’Neil reveals, the mathematical models being used today are unregulated and uncontestable, even when they’re wrong. Most troubling, they reinforce discrimination—propping up the lucky, punishing the downtrodden, and undermining our democracy in the process. Welcome to the dark side of Big Data."),
("The Stranger", "Albert Camus", 9780679720201, 123, 4.4, "With the intrigue of a psychological thriller, The Stranger—Camus's masterpiece—gives us the story of an ordinary man unwittingly drawn into a senseless murder on an Algerian beach. With an Introduction by Peter Dunwoodie; translated by Matthew Ward."),
("Empire of Pain: The Secret History of the Sackler Dynasty", "Patrick Radden Keefe", 9780385545686, 535, 4.54, "The Sackler name adorns the walls of many storied institutions: Harvard, the Metropolitan Museum of Art, Oxford, the Louvre. They are one of the richest families in the world, known for their lavish donations to the arts and sciences. The source of the family fortune was vague, however, until it emerged that the Sacklers were responsible for making and marketing OxyContin, a blockbuster painkiller that was a catalyst for the opioid crisis."),
("Gravity’s Rainbow", "Thomas Pynchon", 9780143039945, 776, 4.01, "Winner of the 1973 National Book Award, Gravity's Rainbow is a postmodern epic, a work as exhaustively significant to the second half of the 20th century as Joyce's Ulysses was to the first. Its sprawling, encyclopedic narrative, and penetrating analysis of the impact of technology on society make it an intellectual tour de force."),
("Discipline and Punish: The Birth of the Prison", "Michel Foucalt", 9780679752554, 333, 4.23, "Barely two hundred and fifty years ago a man condemned of attempting to assassinate the King of France was drawn and quartered in a grisly spectacle that suggested an unmediated duel between the violence of the criminal and the violence of the state. This groundbreaking book by the most influential philosopher since Sartre compels us to reevaluate our assumptions about all the ensuing reforms in the penal institutions of the West. For as he examines innovations that range from the abolition of torture to the institution of forced labor and the appearance of the modern penitentiary, Michel Foucault suggests that punishment has shifted its focus from the prisoner's body to the soul — and that our very concern with rehabilitation encourages and refines criminal activity."),
("The Sign In Sidney Brustein's Window", "Lorraine Hansberry", 9780394407135, 126, 3.69, "By the time of her death at age thirty-four, Lorraine Hansberry had created two electrifying masterpieces of the American theater. With A Raisin in the Sun she gave this country its most movingly authentic portrayal of black family life in the inner city. Barely five years later, with The Sign in Sidney Brustein's Window, Hansberry gave us an unforgettable portrait of a man struggling wit his individual fate in an age of racial and social injustice. These two plays remain milestones in the American theater, remarkable not only for their historical value but for their continual ability to engage the imagination and heart. With an Introduction by Robert Nemiroff."),
("Parable of the Sower", "Octavia E. Butler", 9780446675505, 345, 4.21, "In 2024, with the world descending into madness and anarchy, one woman begins a fateful journey toward a better future. Lauren Olamina and her family live in one of the only safe neighborhoods remaining on the outskirts of Los Angeles. Behind the walls of their defended enclave, Lauren’s father, a preacher, and a handful of other citizens try to salvage what remains of a culture that has been destroyed by drugs, disease, war, and chronic water shortages. While her father tries to lead people on the righteous path, Lauren struggles with hyperempathy, a condition that makes her extraordinarily sensitive to the pain of others. When fire destroys their compound, Lauren’s family is killed and she is forced out into a world that is fraught with danger. With a handful of other refugees, Lauren must make her way north to safety, along the way conceiving a revolutionary idea that may mean salvation for all mankind."),
("The Queue", "Basma Abdel Aziz", 9781612195162, 224, 3.9, "In a surreal, but familiar, vision of modern day Egypt, a centralized authority known as ‘the Gate’ has risen to power in the aftermath of the ‘Disgraceful Events,’ a failed popular uprising. Citizens are required to obtain permission from the Gate in order to take care of even the most basic of their daily affairs, yet the Gate never opens, and the queue in front of it grows longer. Citizens from all walks of life mix and wait in the sun: a revolutionary journalist, a sheikh, a poor woman concerned for her daughter’s health, and even the brother of a security officer killed in clashes with protestors. Among them is Yehia, a man who was shot during the Events and is waiting for permission from the Gate to remove a bullet that remains lodged in his pelvis. Yehia’s health steadily declines, yet at every turn, officials refuse to assist him, actively denying the very existence of the bullet. Ultimately it is Tarek, the principled doctor tending to Yehia’s case, who must decide whether to follow protocol as he has always done, or to disobey the law and risk his career to operate on Yehia and save his life."),
("When We Cease to Understand the World", "Benjamín Labatut", 9781681375663, 192, 4.4, "Fritz Haber, Alexander Grothendieck, Werner Heisenberg, Erwin Schrödinger—these are some of luminaries into whose troubled lives Benjamín Labatut thrusts the reader, showing us how they grappled with the most profound questions of existence. They have strokes of unparalleled genius, alienate friends and lovers, descend into isolation and insanity. Some of their discoveries reshape human life for the better; others pave the way to chaos and unimaginable suffering. The lines are never clear."),
("The Master and Margarita", "Mikhail Bulgakov", 9780679760801, 372, 4.29, "One hot spring, the devil arrives in Moscow, accompanied by a retinue that includes a beautiful naked witch and an immense talking black cat with a fondness for chess and vodka. The visitors quickly wreak havoc in a city that refuses to believe in either God or Satan. But they also bring peace to two unhappy Muscovites: one is the Master, a writer pilloried for daring to write a novel about Christ and Pontius Pilate; the other is Margarita, who loves the Master so deeply that she is willing literally to go to hell for him. What ensues is a novel of inexhaustible energy, humor, and philosophical depth, a work whose nuances emerge for the first time in Diana Burgin's and Katherine Tiernan O'Connor's splendid English version."),
("Infinite Jest", "David Foster Wallace", 9780316066525, 1079, 4.4, "A gargantuan, mind-altering comedy about the pursuit of happiness in America. Set in an addicts' halfway house and a tennis academy, and featuring the most endearingly screwed-up family to come along in recent fiction, Infinite Jest explores essential questions about what entertainment is and why it has come to so dominate our lives; about how our desire for entertainment affects our need to connect with other people; and about what the pleasures we choose say about who we are.")
;

-- Insert book lists
INSERT INTO book_lists (user_id, list_name) VALUES
(1, 'Current Reads'),
(1, 'Unread'),
(1, 'Wish List'),
(1, 'Finished'),
(2, 'Current Reads'),
(2, 'Unread'),
(2, 'Wish List'),
(2, 'Finished'),
(3, 'Current Reads'),
(3, 'Unread'),
(3, 'Wish List'),
(3, 'Finished');

-- Insert book list items
INSERT INTO book_list_items (book_list_id, book_id) VALUES
(1, 1),
(1, 2),
(1, 8),
(1, 22),
(2, 3),
(2, 4),
(2, 15),
(2, 20),
(2, 18),
(3, 5),
(3, 6),
(3, 9),
(3, 12),
(4, 10),
(4, 11),
(4, 13),
(4, 7);

-- Insert reviews
INSERT INTO reviews (book_id, user_id, rating, review_text) VALUES
(1, 1, 5, 'A thought-provoking masterpiece.'),
(2, 2, 4, 'A timeless classic.'),
(3, 3, 5, 'An iconic piece of literature.'),
(4, 2, 4, 'Such a historially significant book.'),
(5, 1, 5, 'I think about this book every day.'),
(1, 2, 5, 'So good I have no words.'),
(6, 3, 5, 'Could not put this book down.'),
(7, 2, 5, 'Such a powerful book. You will think about it regularly.'),
(8, 1, 4, 'I had no idea what was going on for most of the book, but it was still enjoyable.'),
(9, 2, 5, 'Toni Morrison once again at her best.'),
(10, 1, 5, 'Arguably Kafka on The Shore times ten.'),
(11, 2, 5, 'The fig tree analogy will stay with me forever.'),
(12, 1, 5, 'I was on the edge of my seat for the whole book.'),
(13, 2, 5, 'Such powerful writing that just loops back around and hits you again.'),
(14, 1, 4, 'Very timely read.'),
(15, 2, 4, 'Finally got around to reading this and it was really good.'),
(16, 3, 5, 'This book will make you question your faith in humanity. Will never look at big pharma in the same way again.'),
(17, 1, 4, 'I thought I was confused with The Crying of Lot 49, but I did not know what was coming for me with this book.'),
(18, 3, 4, 'Foucalt is always an interesting time.'),
(19, 2, 4, 'Lorraine Hansberry knew how to write.'),
(20, 3, 5, 'The predictions in this book are scarily accurate.'),
(21, 2, 5, 'If you like 1984, you need to read this book.'),
(22, 3, 4, 'Such an interesting blend of fiction and nonfiction.'),
(23, 1, 4, 'Really enjoyed this book.'),
(24, 2, 3, 'I was warned and yet I read it anyways.')
;

