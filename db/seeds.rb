adjectives = ["able",
              "accepting",
              "accountable",
              "adaptable",
              "aggressive",
              "assertive",
              "available",
              "bold",
              "brave",
              "calm",
              "caring",
              "cheerful",
              "clever",
              "collaborative",
              "communicative",
              "competitive",
              "complex",
              "confident",
              "dependable",
              "dignified",
              "discouraged",
              "disingenuous",
              "disorganized",
              "distracted",
              "driven",
              "egotistical",
              "empathetic",
              "energetic",
              "extroverted",
              "focused",
              "friendly",
              "giving",
              "happy",
              "hardworking",
              "helpful",
              "helpless",
              "honest",
              "idealistic",
              "impatient",
              "independent",
              "ingenious",
              "intelligent",
              "introverted",
              "irresponsible",
              "kind",
              "knowledgeable",
              "logical",
              "mature",
              "modest",
              "motivating",
              "needy",
              "nervous",
              "oblivious",
              "observant",
              "organized",
              "passive",
              "patient",
              "perserverant",
              "positive",
              "powerful",
              "proud",
              "reflective",
              "relaxed",
              "relentless",
              "responsible",
              "responsive",
              "rigid",
              "rude",
              "searching",
              "self-conscious",
              "selfish",
              "selfless",
              "sensible",
              "sentimental",
              "spontaneous",
              "strategic",
              "sympathetic",
              "tense",
              "trustworthy",
              "unavailable",
              "uncaring",
              "uncompromising",
              "unfocused",
              "unresponsive",
              "warm",
              "wise",
              "withholding",
              "witty"]

adjectives.each do |adjective|
  Adjective.create(name: adjective)
end
