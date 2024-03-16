require "open-uri"


User.destroy_all
Candidate.destroy_all
Company.destroy_all
Job.destroy_all

# Create users candidate
john_doe = User.create!(email: 'john.doe@gmail.com', password: 'password', role: :role_candidate)
emily_smith = User.create!(email: 'emily.smith@gmail.com', password: 'password', role: :role_candidate)
alexander_wang = User.create!(email: 'alexander.wang@gmail.com', password: 'password', role: :role_candidate)
jennifer_white = User.create!(email: 'jennifer.white@gmail.com', password: 'password', role: :role_candidate)
gabriel_silva = User.create!(email: 'gabriel.silva@gmail.com', password: 'password', role: :role_candidate)


airbnb_user = User.create!(email: 'airbnb@gmail.com', password: 'password', role: :role_company)
klarna_user = User.create!(email: 'klarna@gmail.com', password: 'password', role: :role_company)
stripe_user = User.create!(email: 'stripe@gmail.com', password: 'password', role: :role_company)
apple_user = User.create!(email: 'apple@gmail.com', password: 'password', role: :role_company)
deel_user = User.create!(email: 'deel@gmail.com', password: 'password', role: :role_company)

# Create companies
airbnb_company = Company.new(
  name: 'Airbnb',
  headquarters: 'San Francisco, California, United States',
  industry: 'Hospitality, Travel, Technology',
  description: 'Airbnb is a popular online platform connecting travelers with unique lodging options and experiences worldwide. Established in 2008, it enables hosts to rent out their properties and offers guests a diverse range of accommodation choices, including homes, rooms, and shared spaces. Additionally, Airbnb provides curated local experiences for travelers seeking immersive cultural activities.',
  contact_info: 'www.airbnb.com',
  user: airbnb_user
)

file = URI.open("https://images.prismic.io/voitto-blog/ZTE2YTAwODItYWMzZS00NmZhLTllZGMtN2MyOTI1ZmZlYTZh_w8jy2yqyjcmbihlshvudxw-dkh-r4w_yankxdja-ua8ztto1imreolaamuvgh1fa442j4k8idtotpa81perilirfqgkaeyfgat5vk1tzvk0yy_kuncszdt0qff0hkt3clrymyssi")
airbnb_company.logo.attach(io: file, filename: "airbnb.png", content_type: "image/png")
airbnb_company.save!

klarna_company = Company.new(
  name: 'Klarna Bank AB',
  headquarters: 'Stockholm, Sweden',
  industry: 'Financial Technology (FinTech), E-commerce',
  description: 'Klarna is a Swedish bank and financial technology company that provides payment solutions for online shopping and e-commerce. It offers a range of payment services, including buy now, pay later options, installment payments, and financing solutions.',
  contact_info: 'https://www.klarna.com/',
  user: klarna_user
)

file = URI.open("https://www.apkmirror.com/wp-content/themes/APKMirror/ap_resize/ap_resize.php?src=https%3A%2F%2Fdownloadr2.apkmirror.com%2Fwp-content%2Fuploads%2F2022%2F08%2F69%2F6305fa812f599.png&w=192&h=192&q=100")
klarna_company.logo.attach(io: file, filename: "klarna.png", content_type: "image/png")
klarna_company.save!

# Create companies
stripe_company = Company.new(
  name: 'Stripe, Inc.',
  headquarters: 'San Francisco, California, United States',
  industry: 'Financial Technology (FinTech)',
  description: 'Stripe is an American financial technology company that offers payment processing software and application programming interfaces (APIs) for e-commerce websites and mobile applications. It enables businesses to accept payments over the internet.',
  contact_info: 'https://stripe.com/',
  user: stripe_user # Assigning the first user as the owner of the company, you may need to adjust this
)

file = URI.open("https://cdn.icon-icons.com/icons2/2699/PNG/512/stripe_logo_icon_167962.png")
stripe_company.logo.attach(io: file, filename: "stripe.png", content_type: "image/png")
stripe_company.save!

apple_company = Company.new(
  name: 'Apple Inc.',
  headquarters: 'Cupertino, California, United States',
  industry: 'Technology',
  description: "Apple Inc. is a multinational technology company headquartered in Cupertino, California. Renowned for its innovative products and services, Apple designs, develops, and sells consumer electronics, software, and online services. Best known for iconic products such as the iPhone, iPad, Mac, and Apple Watch, the company is committed to delivering cutting-edge technology and exceptional user experiences.",
  contact_info: 'https://support.apple.com/.',
  user: apple_user
)

file = URI.open("https://media.designrush.com/inspiration_images/134802/conversions/_1511456315_653_apple-mobile.jpg")
apple_company.logo.attach(io: file, filename: "apple.png", content_type: "image/png")
apple_company.save!

deel_company = Company.new(
  name: 'Deel',
  headquarters: 'San Francisco, California, United States',
  industry: 'Human Resources, Fintech',
  description: 'Deel is a global payroll and compliance platform for remote teams. It provides solutions for companies to hire, manage, and pay remote employees and contractors worldwide, handling compliance, taxes, and international payments.',
  contact_info: 'https://www.letsdeel.com/',
  user: deel_user
)

file = URI.open("https://assets.ellaa.app/deel-logo.png")
deel_company.logo.attach(io: file, filename: "deel.png", content_type: "image/png")
deel_company.save!

# Create candidates
candidate = Candidate.new(
  first_name: 'John',
  last_name: 'Doe',
  address: '123 Main St, New York, USA',
  nationality: 'United States',
  gender: 'Male',
  summary: "I recently graduated with a Bachelor's degree in Computer Science from Brown University. During my studies, I focused on a variety of programming languages, algorithms, and software development methodologies. I completed several projects, including developing web applications, mobile apps, and machine learning models. I'm eager to apply my knowledge and skills in a professional setting, with a particular interest in software engineering or data science roles within the tech industry.",
  tech_interest: ['Back-end Development', 'Data Science'],
  tech_languages: ['Ruby', 'JavaScript'],
  preferred_companies: 'Google, Stripe',
  user: john_doe,
  birth_date: Date.new(2003, 8, 27),
  terms_conditions: true
)

file = URI.open("https://images.unsplash.com/photo-1632761637833-b8be546ff075")
candidate.photo.attach(io: file, filename: "john_doe.png", content_type: "image/png")
candidate.save!


candidate = Candidate.new(
  first_name: 'Emily',
  last_name: 'Smith',
  address: '456 Oak St, Toronto, Canada',
  nationality: 'Canadian',
  gender: 'Female',
  summary: "I recently completed an intensive coding bootcamp. Through the bootcamp, I gained foundational skills in web development, including HTML, CSS, JavaScript, and React. Before transitioning into tech, I worked in a non-technical role in marketing. However, I discovered my passion for technology and decided to pursue a career change. I/m highly motivated, eager to learn, and excited about the prospect of starting a new career as a software developer or UX/UI designer.",
  tech_interest: ['Front-end Development', 'UX/UI Design'],
  tech_languages: ['JavaScript', 'TypeScript'],
  preferred_companies: 'Airbnb, Figma',
  user: emily_smith,
  birth_date: Date.new(1990, 4, 9),
  terms_conditions: true
)

file = URI.open("https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
candidate.photo.attach(io: file, filename: "emily_smith.png", content_type: "image/png")
candidate.save!

candidate = Candidate.new(
  first_name: 'Alexander',
  last_name: 'Wang',
  address: '789 Elm St, Beijing, China',
  nationality: 'American',
  gender: 'Male',
  summary: "My name is Alexander, and I'm a self-taught individual passionate about technology. With a background in finance and investment analysis, I've spent several years working in the financial sector, analyzing market trends and evaluating investment opportunities. However, my curiosity and interest in technology led me to explore coding and web development in my free time. Through self-directed learning and online resources, I've acquired proficiency in languages such as HTML, CSS, JavaScript, and Python. I've also developed projects independently, including websites and small applications, to further hone my skills.",
  tech_interest: ['Mobile App Development', 'Back-end Development'],
  tech_languages: ['Python', 'JavaScript'],
  preferred_companies: 'Klarna, Stripe',
  user: alexander_wang,
  birth_date: Date.new(1989, 2, 15),
  terms_conditions: true
)

  file = URI.open("https://images.unsplash.com/photo-1557862921-37829c790f19?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  candidate.photo.attach(io: file, filename: "alexander_wang.png", content_type: "image/png")
  candidate.save!


candidate = Candidate.new(
  first_name: 'Jennifer',
  last_name: 'White',
  address: '567 Pine St, London, UK',
  nationality: 'British',
  gender: 'Female',
  summary: "My name is Emily, and I'm a recent graduate with a degree in Computer Science, eager to kickstart my career in the tech industry. Throughout my studies, I developed a strong foundation in programming languages, algorithms, and software development methodologies.  I have knowledge in web development, having studied HTML, CSS, and JavaScript. Now, I'm actively seeking product manager roles within the tech industry, where I can leverage my technical background, design skills, and understanding of web development to drive product innovation and success.",
  tech_interest: ['Product Management'],
  tech_languages: ['JavaScript'],
  preferred_companies: 'EY Consulting, Cisco',
  user: jennifer_white,
  birth_date: Date.new(2001, 12, 21),
  terms_conditions: true
)

  file = URI.open("https://images.unsplash.com/photo-1472849676747-48a51c0c30b6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  candidate.photo.attach(io: file, filename: "jennifer_white.png", content_type: "image/png")
  candidate.save!

candidate = Candidate.new(
  first_name: 'Gabriel',
  last_name: 'Silva',
  address: '123 Avenida Brasil, São Paulo, Brazil',
  nationality: 'Brazilian',
  gender: 'Male',
  summary: "I'm a recent Computer Engineering graduate passionate about technology. With expertise in Java, Python, and Go, I'm eager to delve into Cloud Computing and DevOps. Through hands-on projects and coursework, I've gained proficiency in software development and hardware projects. I'm now seeking opportunities to apply my skills and interests in a professional setting, contributing to innovative projects within the tech industry.",
  tech_interest: ['Cloud Computing', 'DevOps & SysOps'],
  tech_languages: ['Java', 'Python', 'Go'],
  preferred_companies: 'Google, Oracle, Microsoft, SalesForce',
  user: gabriel_silva,
  birth_date: Date.new(2003, 10, 16),
  terms_conditions: true
)

  file = URI.open("https://images.unsplash.com/photo-1541178735493-479c1a27ed24?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  candidate.photo.attach(io: file, filename: "gabriel_silva.png", content_type: "image/png")
  candidate.save!

# # Create jobs
job = Job.create!(
  title: 'Junior Frontend Developer',
  job_description: "Join our team as a Junior Frontend Developer, where you'll assist in building responsive and user-friendly web applications. You'll work closely with our frontend team to implement designs and enhance user experiences.",
  soft_skills: 'Communication, teamwork',
  programming_languages: ['HTML', 'CSS', 'JavaScript'],
  work_visa: 'Sponsorship available',
  salary: '$5.000',
  benefits: 'Health insurance, flexible work hours',
  application_deadline: Date.today + 30,
  date_posted: Date.today,
  location: 'San Francisco, USA / Remote',
  company: airbnb_company
)

# job = Job.create!(
#   title: 'Associate Software Engineer',
#   job_description: "We're seeking an Associate Software Engineer to join our growing team. In this role, you'll assist in developing and maintaining software applications, working alongside experienced engineers to learn and grow your skills.",
#   soft_skills: 'Problem-solving, adaptability',
#   programming_languages: 'Java, Python',
#   work_visa: 'Sponsorship not available',
#   salary: '£3,500',
#   benefits: 'Retirement plan, professional development opportunities',
#   application_deadline: Date.today + 30,
#   date_posted: Date.today,
#   location: 'London, UK / Hybrid',
#   company_id: company.id
# )

# job = Job.create!(
#   title: 'Entry-Level Backend Developer',
#   job_description: 'Exciting opportunity for an Entry-Level Backend Developer to join our team. You/ll work on backend systems, writing clean and efficient code to support our applications and services.',
#   soft_skills: 'Collaboration, attention to detail',
#   programming_languages: 'Ruby, SQL',
#   work_visa: 'Sponsorship available',
#   salary: '€3,000',
#   benefits: 'Health insurance, gym membership subsidy',
#   application_deadline: Date.today + 30,
#   date_posted: Date.today,
#   location: 'Berlin, Germany',
#   company_id: company.id
# )

# job = Job.create!(
#   title: 'Software Development Intern',
#   job_description: 'Kickstart your career with our Software Development Internship program. You/ll work closely with our engineering team, gaining hands-on experience in software development while contributing to real projects.',
#   soft_skills: 'Initiative, willingness to learn',
#   programming_languages: 'JavaScript, PHP',
#   work_visa: 'Sponsorship not available',
#   salary: 'CAD 2,500',
#   benefits: 'Mentorship program, networking opportunities',
#   application_deadline: Date.today + 30,
#   date_posted: Date.today,
#   location:'Toronto, Canada',
#   company_id: company.id
# )

# job = Job.create!(
#   title: 'Junior Full Stack Developer',
#   job_description: 'We/re hiring a Junior Full Stack Developer to join our dynamic team. You/ll work on both frontend and backend development, collaborating with cross-functional teams to deliver high-quality software solutions.',
#   soft_skills: 'Problem-solving, teamwork',
#   programming_languages: 'JavaScript, Python',
#   work_visa: 'Sponsorship available',
#   salary: 'AUD 6,000',
#   benefits: 'Health insurance, flexible work environment',
#   application_deadline: Date.today + 30,
#   date_posted: Date.today,
#   location: 'Sydney, Australia'
#   company_id: company.id
# )

# job = Job.create!(
#   title: 'Associate Web Developer',
#   job_description: 'Description of the job',
#   soft_skills: 'Communication, teamwork',
#   programming_languages: 'Ruby, JavaScript',
#   work_visa: 'Sponsorship available',
#   salary: 'R$4,000',
#   benefits: 'Health insurance, retirement plan',
#   application_deadline: Date.today + 30,
#   date_posted: Date.today,
#   location: 'São Paulo, Brazil'
#   company_id: company.id
# )

# job = Job.create!(
#   title: 'Software Engineering Trainee',
#   job_description: 'Join our Software Engineering Trainee program and gain valuable experience in software development. You/ll receive mentorship from experienced engineers and work on real-world projects to enhance your skills.',
#   soft_skills: 'Communication, teamwork',
#   programming_languages: 'Ruby, JavaScript',
#   work_visa: 'Sponsorship available',
#   salary: '¥200,000',
#   benefits: 'Health insurance, retirement plan',
#   application_deadline: Date.today + 30,
#   date_posted: Date.today,
#   location:'Tokyo, Japan'
#   company_id: company.id
# )

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
#   location:
#   company_id: company.id
# )

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
#   location:
#   company_id: company.id
# )

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
#   location:
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
