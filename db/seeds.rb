User.destroy_all
Candidate.destroy_all
Company.destroy_all
Job.destroy_all

# # Create users
# User.create!(email: 'john.doe@gmail.com', password: 'password', role: 0) # You can add more users as needed
# User.create!(email: 'emily.smith@gmail.com', password: 'password', role: 0) # You can add more users as needed
# User.create!(email: 'alexander.wang@gmail.com', password: 'password', role: 0) # You can add more users as needed
# User.create!(email: 'jennifer.white@gmail.com', password: 'password', role: 0) # You can add more users as needed
# User.create!(email: 'gabriel.silva@gmail.com', password: 'password', role: 0) # You can add more users as needed




# Create companies
# company = Company.create!(
#   name: 'Airbnb',
#   headquarters: 'San Francisco, California, United States',
#   industry: 'Hospitality, Travel, Technology',
#   description: 'Airbnb is a popular online platform connecting travelers with unique lodging options and experiences worldwide. Established in 2008, it enables hosts to rent out their properties and offers guests a diverse range of accommodation choices, including homes, rooms, and shared spaces. Additionally, Airbnb provides curated local experiences for travelers seeking immersive cultural activities.',
#   contact_info: 'www.airbnb.com',
#   user_id: User.first.id # Assigning the first user as the owner of the company, you may need to adjust this
# )

# # Create companies
# company = Company.create!(
#   name: 'Klarna Bank AB',
#   headquarters: 'Stockholm, Sweden',
#   industry: 'Financial Technology (FinTech), E-commerce',
#   description: 'Klarna is a Swedish bank and financial technology company that provides payment solutions for online shopping and e-commerce. It offers a range of payment services, including buy now, pay later options, installment payments, and financing solutions.',
#   contact_info: 'https://www.klarna.com/',
#   user_id: User.first.id # Assigning the first user as the owner of the company, you may need to adjust this
# )

# # Create companies
# company = Company.create!(
#   name: 'Stripe, Inc.',
#   headquarters: 'San Francisco, California, United States',
#   industry: 'Financial Technology (FinTech)',
#   description: 'Stripe is an American financial technology company that offers payment processing software and application programming interfaces (APIs) for e-commerce websites and mobile applications. It enables businesses to accept payments over the internet.',
#   contact_info: 'https://stripe.com/',
#   user_id: User.first.id # Assigning the first user as the owner of the company, you may need to adjust this
# )

# # Create companies
# company = Company.create!(
#   name: 'Apple Inc.',
#   headquarters: 'Cupertino, California, United States',
#   industry: 'Technology',
#   description: 'A description of the company',
#   contact_info: 'https://support.apple.com/.',
#   user_id: User.first.id # Assigning the first user as the owner of the company, you may need to adjust this
# )

# # Create companies
# company = Company.create!(
#   name: 'Deel',
#   headquarters: 'San Francisco, California, United States',
#   industry: 'Human Resources, Fintech',
#   description: 'Deel is a global payroll and compliance platform for remote teams. It provides solutions for companies to hire, manage, and pay remote employees and contractors worldwide, handling compliance, taxes, and international payments.',
#   contact_info: 'https://www.letsdeel.com/',
#   user_id: User.first.id # Assigning the first user as the owner of the company, you may need to adjust this
# )



# # Create candidates
# candidate = Candidate.create!(
#   first_name: 'John',
#   last_name: 'Doe',
#   address: '123 Main St, New York, USA',
#   nationality: 'American',
#   gender: 'Male',
#   photo: 'john_photo.jpg', # You may need to adjust this to an actual photo file
#   summary: 'I recently graduated with a Bachelor/s degree in Computer Science from Brown University. During my studies, I focused on a variety of programming languages, algorithms, and software development methodologies. I completed several projects, including developing web applications, mobile apps, and machine learning models. I/m eager to apply my knowledge and skills in a professional setting, with a particular interest in software engineering or data science roles within the tech industry.',
#   tech_interest: ['Web Development', 'Data Science'],
#   tech_languages: ['Ruby', 'JavaScript'],
#   preferred_companies: 'Google, Stripe',
#   cv_upload: 'john_cv.pdf', # You may need to adjust this to an actual CV file
#   user_id: User.first.id,
#   birth_date: Date.new(2003, 8, 27),
#   terms_conditions: true
# )

# candidate = Candidate.create!(
#   first_name: 'Emily',
#   last_name: 'Smith',
#   address: '456 Oak St, Toronto, Canada',
#   nationality: 'Canadian',
#   gender: 'Female',
#   photo: 'emily_photo.jpg', # You may need to adjust this to an actual photo file
#   summary: 'My name is David, and I recently completed an intensive coding bootcamp. Through the bootcamp, I gained foundational skills in web development, including HTML, CSS, JavaScript, and React. Before transitioning into tech, I worked in a non-technical role in marketing. However, I discovered my passion for technology and decided to pursue a career change. I/m highly motivated, eager to learn, and excited about the prospect of starting a new career as a software developer or UX/UI designer.',
#   tech_interest: ['Web Development', 'UX/UI'],
#   tech_languages: ['JavaScript', 'React'],
#   preferred_companies: 'Airbnb, Figma',
#   cv_upload: 'emily_cv.pdf', # You may need to adjust this to an actual CV file
#   user_id: User.first.id,
#   birth_date: Date.new(1990, 4, 9),
#   terms_conditions: true

#   candidate = Candidate.create!(
#     first_name: 'Alexander',
#     last_name: 'Wang',
#     address: '789 Elm St, Beijing, China',
#     nationality: 'American',
#     gender: 'Male',
#     photo: 'alexander_photo.jpg', # You may need to adjust this to an actual photo file
#     summary: 'My name is Alexander, and I/m a self-taught individual passionate about technology. With a background in finance and investment analysis, I/ve spent several years working in the financial sector, analyzing market trends and evaluating investment opportunities. However, my curiosity and interest in technology led me to explore coding and web development in my free time. Through self-directed learning and online resources, I/ve acquired proficiency in languages such as HTML, CSS, JavaScript, and Python. I/ve also developed projects independently, including websites and small applications, to further hone my skills. ',
#     tech_interest: ['Mobile Development', 'Web Development'],
#     tech_languages: ['Python', 'JavaScript'],
#     preferred_companies: 'Klarna, Stripe',
#     cv_upload: 'alexander_cv.pdf', # You may need to adjust this to an actual CV file
#     user_id: User.first.id,
#     birth_date: Date.new(1989, 2, 15),
#     terms_conditions: true

#   candidate = Candidate.create!(
#     first_name: 'Jennifer',
#     last_name: 'White',
#     address: '567 Pine St, London, UK',
#     nationality: 'British',
#     gender: 'Female',
#     photo: 'jennifer_photo.jpg', # You may need to adjust this to an actual photo file
#     summary: 'My name is Emily, and I/m a recent graduate with a degree in Computer Science, eager to kickstart my career in the tech industry. Throughout my studies, I developed a strong foundation in programming languages, algorithms, and software development methodologies.  I have knowledge in web development, having studied HTML, CSS, and JavaScript. Now, I/m actively seeking product manager roles within the tech industry, where I can leverage my technical background, design skills, and understanding of web development to drive product innovation and success.',
#     tech_interest: ['Product Management'],
#     tech_languages: ['JavaScript'],
#     preferred_companies: 'EY Consulting, Cisco',
#     cv_upload: 'jennifer_cv.pdf', # You may need to adjust this to an actual CV file
#     user_id: User.first.id,
#     birth_date: Date.new(2001, 12, 21),
#     terms_conditions: true

#   candidate = Candidate.create!(
#     first_name: 'Gabriel',
#     last_name: 'Silva',
#     address: '123 Avenida Brasil, São Paulo, Brazil',
#     nationality: 'Brazilian',
#     gender: 'Male',
#     photo: 'photo.jpg', # You may need to adjust this to an actual photo file
#     summary: 'Summary of qualifications and experience',
#     tech_interest: ['Cloud Computing', 'DevOps'],
#     tech_languages: ['Java', 'Python', 'Go'],
#     preferred_companies: 'Google, Oracle, Microsoft, SalesForce',
#     cv_upload: 'gabriel_cv.pdf', # You may need to adjust this to an actual CV file
#     user_id: User.first.id,
#     birth_date: Date.new(1990, 1, 1),
#     terms_conditions: true

# # Create jobs
# job = Job.create!(
#   title: 'Software Engineer',
#   job_description: 'Description of the job',
#   soft_skills: 'Communication, teamwork',
#   programming_languages: 'Ruby, JavaScript',
#   work_visa: 'Sponsorship available',
#   salary: 80000.00,
#   benefits: 'Health insurance, retirement plan',
#   application_deadline: Date.today + 30,
#   date_posted: Date.today,
#   company_id: company.id
# )


# # Create matches
# Match.create!(
#   status: 0,
#   candidate_id: candidate.id,
#   job_id: job.id
# )



# # image = ActionController::Base.helpers.asset_path("ganza.jpg")
# image = File.open(Rails.root.join('app', 'assets', 'images', 'ganza.jpg'))
# puts "esta é a #{image}"

# user = User.create!(email: "jane.doe@mail.com", password: "123123", role: "role_candidate")
# Candidate.create!(
#   first_name: "Jane",
#   last_name: "Doe",
#   address: "123 Main St, Anytown, USA",
#   nationality: "American",
#   gender: "Female",
#   birth_date: Date.new(1990, 3, 1),
#   photo: nil,
#   summary: "A passionate developer...",
#   tech_interest: "Web development",
#   tech_languages: "Ruby, JavaScript",
#   preferred_companies: "GitHub, Google",
#   cv_upload: nil,
#   terms_conditions: "true",
#   user: user
# )

# user_two = User.create!(email: "company@mail.com", password: "123123", role: "role_company")
# company = Company.create!(
#   name: "company",
#   headquarters: "SP",
#   industry: "Tech",
#   description: "very nice",
#   contact_info: "url",
#   user: user_two
# )

# Job.create!(
#   title: "Software Engineer",
#   job_description: "Great experience for newbies",
#   soft_skills: "Communication",
#   programming_languages: "Ruby",
#   work_visa: "sure",
#   salary: 1000.0,
#   benefits: "some",
#   application_deadline: Date.new(2024, 3, 28),
#   date_posted: Date.today,
#   location: 'São Paulo',
#   company: company,
#   status: 0
# )
