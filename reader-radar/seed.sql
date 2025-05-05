-- Seed data for the database in dev

-- Insert users
INSERT INTO users (username, password) VALUES
('rose_tyler', 'badwolf'),
('martha_jones', 'freedom'),
('donna_noble', 'noble123');

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
("The Time Traveler's Wife", "Audrey Niffenegger", 9781931561464, 546, 5, "This is the extraordinary love story of Clare and Henry, who met when Clare was six and Henry was thirty-six, and were married when Clare was twenty-two and Henry was thirty. Impossible but true, because Henry suffers from a rare condition where his genetic clock periodically resets and he finds himself pulled suddenly into his past or future. In the face of this force they can neither prevent nor control, Henry and Clare’s struggle to lead normal lives is both intensely moving and entirely unforgettable."),
("The Hitchhiker's Guide to the Galaxy", "Douglas Adams", 9780345418913, 224, 5, "Seconds before the Earth is demolished to make way for a galactic freeway, Arthur Dent is plucked off the planet by his friend Ford Prefect, a researcher for the revised edition of The Hitchhiker's Guide to the Galaxy who, for the last fifteen years, has been posing as an out-of-work actor."),
("The Martian", "Andy Weir", 9780804139021, 384, 5, "Six days ago, astronaut Mark Watney became one of the first people to walk on Mars. Now, he’s sure he’ll be the first person to die there. After a dust storm nearly kills him and forces his crew to evacuate while thinking him dead, Mark finds himself stranded and completely alone with no way to even signal Earth that he’s alive—and even if he could get word out, his supplies would be gone long before a rescue could arrive. Chances are, though, he won’t have time to starve to death. The damaged machinery, unforgiving environment, or plain-old “human error” are much more likely to kill him first. But Mark isn’t ready to give up yet. Drawing on his ingenuity, his engineering skills—and a relentless, dogged refusal to quit—he steadfastly confronts one seemingly insurmountable obstacle after the next. Will his resourcefulness be enough to overcome the impossible odds against him?"),
("Dune", "Frank Herbert", 9780593099322, 658, 5, "Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the “spice” melange, a drug capable of extending life and enhancing consciousness. Coveted across the known universe, melange is a prize worth killing for..."),
("Kafka on the Shore", "Haruki Murakami", 9781400079278, 467, 5, "Kafka on the Shore, a tour de force of metaphysical reality, is powered by two remarkable characters: a teenage boy, Kafka Tamura, who runs away from home either to escape a gruesome oedipal prophecy or to search for his long-missing mother and sister; and an aging simpleton called Nakata, who never recovered from a wartime affliction and now is drawn toward Kafka for reasons that, like the most basic activities of daily life, he cannot fathom. Their odyssey, as mysterious to them as it is to us, is enriched throughout by vivid accomplices and mesmerizing events. Cats and people carry on conversations, a ghostlike pimp employs a Hegel-quoting prostitute, a forest harbors soldiers apparently unaged since World War II, and rainstorms of fish (and worse) fall from the sky. There is a brutal murder, with the identity of both victim and perpetrator a riddle—yet this, along with everything else, is eventually answered, just as the entwined destinies of Kafka and Nakata are gradually revealed, with one escaping his fate entirely and the other given a fresh start on his own."),
("Normal People", "Sally Rooney", 9781984822185, 304, 5, "Connell Waldron is one of the most popular boys in his small-town high school--he is a star of the football team and an excellent student, and he is never wanting for attention from girls. The one thing he doesn't have is money. Marianne Sheridan, a classmate of Connell's, has the opposite problem. Marianne is plain-looking, odd, and stubborn, and while her family is quite well off, she has no friends to speak of. There is, however, a deep and undeniable connection between the two teenagers, one that develops into a secret relationship. Everything changes when both Connell and Marianne are accepted to Trinity College. Suddenly Marianne is well liked and elegant, holding court with her intellectual friends, while Connell hangs at the sidelines, not quite as fluent in the language of the elite. Throughout their years at university, Marianne and Connell circle each other, falling in and out of romance but never straying far from where they started. And as Marianne experiments with an increasingly dangerous string of boyfriends, Connell must decide how far he is willing to go to save his oldest friend. Sally Rooney brings her brilliant psychological acuity and perfectly spare prose to a novel that explores the subtleties of class, the electricity of first love, and the inescapable challenges of family and friendships. Normal People is a book that you will read in one sitting, and then immediately jump up to share with your friends."),
("Beloved", "Toni Morrison", 9781400033416, 325, 5, "Sethe, its protagonist, was born a slave and escaped to Ohio, but eighteen years later she is still not free. She has too many memories of Sweet Home, the beautiful farm where so many hideous things happened. And Sethe's new home is haunted by the ghost of her baby, who died nameless and whose tombstone is engraved with a single word: Beloved. Filled with bitter poetry and suspense as taut as a rope, Beloved is a towering achievement by Nobel Prize laureate Toni Morrison."),
("The Crying of Lot 49", "Thomas Pynchon", 9780060913076, 152, 5, "Suffused with rich satire, chaotic brilliance, verbal turbulence and wild humor, The Crying of Lot 49 opens as Oedipa Maas discovers that she has been made executrix of a former lover's estate. The performance of her duties sets her on a strange trail of detection, in which bizarre characters crowd in to help or confuse her. But gradually, death, drugs, madness, and marriage combine to leave Oedipa in isolation on the threshold of revelation, awaiting the Crying of Lot 49.")
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
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7);

-- Insert reviews
INSERT INTO reviews (book_id, user_id, rating, review_text) VALUES
(1, 1, 5, 'A thought-provoking masterpiece.'),
(2, 2, 4, 'A timeless classic.'),
(3, 3, 5, 'An iconic piece of literature.');

