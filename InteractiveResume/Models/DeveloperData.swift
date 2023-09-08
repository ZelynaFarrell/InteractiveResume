//
//  DeveloperData.swift
//  InteractiveResume
//
//  Created by Zelyna Sillas on 8/24/23.
//

import Foundation
import SwiftUI

// MARK: Experience Data
struct Experience: Identifiable {
    let id = UUID().uuidString
    var index: Int
    var title: String
    var company: String
    var date: String
    var team: String
    var location: String
    var description1Header: String
    var description1: String
    var description2Header: String
    var description2: String
    var description3Header: String
    var description3: String
    var image: String
    var background: String
    var logo: String
}

struct Community: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var company: String
    var date: String
    var team: String
    var location: String
    var description1Header: String
    var description1: String
    var description2Header: String
    var description2: String
    var description3Header: String
    var description3: String
    var image: String
    var background: String
}

struct Volunteer {
    var title: String
    var company: String
    var mission: String
    var location: String
    var image: String
}

let ExperienceHistory: [Experience] = [
    Experience(index: 1, title: "Project Manager & Marketing Strategist", company:  "Nike", date: "2020 - 2021", team: "Advanced Digital Innovation", location: "Beaverton, OR", description1Header: "Strategic Project Management", description1: "Led projects at Nike's Advanced Digital Innovation division, overseeing timelines, resources, and deliverables. \n\nThis project management expertise translates directly to iOS development, where I can effectively manage the development lifecycle, coordinate tasks among developers, designers, and QA testers, and ensure on-time delivery of high-quality mobile applications.", description2Header: "Data-Driven Marketing", description2: "Developed marketing strategies based on data insights and market trends, optimizing user engagement. \n\nThis data-driven approach is relevant in iOS development, allowing me to analyze user behavior within apps, gather feedback, and iterate on features to create user-centric applications that align with their preferences and maximize user satisfaction.", description3Header: "Cross-Functional Collaboration", description3: "Collaborated with diverse teams including designers, developers, and marketers to execute strategies. \n\nThis collaboration is a key aspect of iOS development, enabling me to work seamlessly with multidisciplinary teams, bridge the gap between design and development, and ensure that the final app aligns with the marketing goals while providing a top-notch user experience.", image: "projectManager", background: "nike", logo: "git"),
    
    Experience(index: 2, title: "Logistics, Communications, & Operations Lead", company:  "Nike", date: "2019 - 2020", team: "Advanced Digital Innovation", location: "Beaverton, OR", description1Header: "Streamlined Operations", description1: "Orchestrated logistics and operations for Nike's Advanced Digital Innovation department, optimizing processes for efficiency. \n\nThis operational expertise translates directly to iOS development, enabling me to streamline development workflows, implement efficient coding practices, and enhance app performance to create seamless and optimized mobile experiences.", description2Header: "Effective Communication", description2: "Managed cross-functional communication within the team and with external stakeholders, ensuring a clear and cohesive exchange of information. \n\nThis communication skill is crucial in iOS development, where I can effectively communicate with designers, product managers, and other team members to align on project goals, provide updates, and address potential roadblocks, resulting in well-coordinated and successful app development.", description3Header: "Innovation and Adaptability", description3: "Worked in Nike's Advanced Digital Innovation sector, where staying at the forefront of technology trends was essential. \n\nThis experience aligns seamlessly with iOS development, allowing me to adopt emerging technologies, explore new coding languages, and innovate with novel app features, ensuring that the developed applications remain cutting-edge and relevant in the dynamic digital landscape.", image: "innovation", background: "nike", logo: "git"),
    
    Experience(index: 3, title: "Photo Studio Stylist Lead", company:  "Nike", date: "2018 - 2019", team: "Global Brand Imaging", location: "Beaverton, OR", description1Header: "Visual Creativity and Design", description1: "Spearheaded creative direction for Nike's global brand imaging, conceptualizing and executing visually stunning photo shoots. \n\nThis artistic vision readily translates to iOS development, where I can leverage design principles to create visually appealing and intuitive user interfaces, ensuring a seamless and engaging experience within mobile applications.", description2Header: "Attention to Detail", description2: "Meticulously curated every aspect of photo shoots, from styling and set design to lighting and composition, ensuring the highest quality standards. \n\nThis attention to detail seamlessly transitions to iOS development, where I can meticulously craft clean and well-structured code, conduct thorough testing, and ensure the flawless execution of app functionalities for a polished end product.", description3Header: "Global Collaboration", description3: "Collaborated with diverse teams across the globe to align creative strategies with Nike's brand identity. \n\nThis experience mirrors the collaborative nature of iOS development, where I can effectively work with cross-functional teams, including designers, developers, and QA testers, to ensure the consistent delivery of apps that embody the brand's values while meeting user expectations on a global scale.", image: "GBI", background: "nike", logo: "git"),
    
    Experience(index: 4, title: "Apparel Manager", company:  "Anthropologie", date: "2018", team: "Retail Management", location: "Portland, OR", description1Header: "Financial Oversight and Budgeting", description1: "Managed a 10 million dollar apparel division, overseeing budgets, expenses, and profitability. \n\nThis financial acumen directly applies to iOS development, where I can effectively allocate resources, manage project budgets, and ensure efficient resource utilization to deliver high-quality apps within budgetary constraints.", description2Header: "Inventory Management and Analysis", description2: "Managed apparel inventory, analyzed sales trends, and made data-driven decisions to optimize stock levels. \n\nThis analytical approach is applicable in iOS development, as I can utilize data analysis tools to monitor user engagement, track feature usage, and make informed decisions about app updates and improvements, ensuring apps remain relevant and effective.", description3Header: "Team Leadership and Development", description3: "Led a team of apparel professionals, fostering their growth and aligning efforts with division goals. \n\nThis leadership experience seamlessly transitions to iOS development, where I can lead and mentor development teams, facilitate knowledge sharing, and create a collaborative environment that nurtures skill development and innovation.", image: "retail", background: "anthropologie", logo: "git"),
    
    Experience(index: 5, title: "Visual Merchandising\n           Team Lead", company:  "Anthropologie", date: "2017", team: "Visual Strategy", location: "Portland, OR", description1Header: "Strategic Design Thinking", description1: "Leveraged keen understanding of consumer psychology and visual communication to create captivating in-store displays, maximizing customer engagement and driving sales. \n\nThis translates to iOS development through the application of user-centered design principles, crafting intuitive and visually appealing mobile interfaces that enhance user interaction and satisfaction.", description2Header: "Data-Driven Optimization", description2: "Utilized data analysis tools to track customer traffic patterns and sales metrics, making informed decisions to optimize product placements and improve overall store aesthetics. \n\nSimilarly, in iOS development, I can harness analytical tools to monitor user behavior within apps, adapting features and functionalities for an enhanced user experience based on real-time data insights.", description3Header: "Cross-Functional Leadership", description3: "Led a diverse visual merchandising team, fostering collaboration between designers, marketers, and sales associates to execute creative visions. \n\nThis experience aligns with iOS development, as I can effectively collaborate with UX/UI designers, QA testers, and fellow developers to ensure seamless integration of front-end designs with back-end functionalities, resulting in robust and visually appealing applications.", image: "anthroVM", background: "anthropologie", logo: "git"),
    
    Experience(index: 6, title: "Assistant Store Manager", company:  "Dr. Martens", date: "2017 - 2018", team: "Retail Management", location: "Portland, OR", description1Header: "Team Collaboration and Leadership", description1: "Directed a dynamic retail team, fostering a culture of open communication and cooperation to achieve store targets. \n\nThis experience seamlessly transitions to iOS development, allowing me to collaborate effectively with designers, QA testers, and fellow developers, ensuring a cohesive approach to creating user-centric and high-performing mobile applications.", description2Header: "Problem-Solving Under Pressure", description2: "Thrived in high-pressure retail situations, swiftly identifying issues and implementing effective solutions to ensure seamless store operations. \n\nThis skill is transferable to iOS development, enabling me to troubleshoot coding challenges, debug issues, and optimize app performance even in time-sensitive scenarios, ensuring a smooth user experience.", description3Header: "Customer-Centric Mindset", description3: "Nurtured lasting customer relationships, addressing inquiries and concerns with empathy and professionalism, resulting in enhanced customer satisfaction. \n\nThis customer-centric approach aligns perfectly with iOS development, as I can prioritize user feedback, integrate user-friendly features, and create apps that cater to the unique needs and preferences of the target audience, ultimately driving higher user engagement and retention.", image: "retail", background: "drmartens", logo: "git"),
    
    Experience(index: 7, title: "Brand Stylist", company:  "AllSaints", date: "2017", team: "Public Relations", location: "New York, NY", description1Header: "Cross-Market Creative Translation", description1: "Translated top-level creative direction from the United Kingdom to resonate with the unique style preferences of the New York City market. \n\nThis skill in adapting creative concepts is relevant in iOS development, where I can translate design guidelines and brand aesthetics into app interfaces that appeal to specific target audiences and capture their attention effectively.", description2Header: "Visual Storytelling", description2: "Crafted compelling visual narratives as an Editorial and Commercial Stylist at AllSaints NYC. \n\nThis storytelling ability readily transfers to iOS development, where I can use UI/UX design principles to create app interfaces that tell a coherent and engaging story, guiding users through the app's functionalities and enhancing their overall experience.", description3Header: "Collaborative Communication", description3: "Collaborated closely with photographers, models, and creative teams to achieve cohesive styling results. \n\nThis collaborative communication approach aligns with iOS development, where I can work effectively with designers, developers, and other stakeholders to ensure seamless integration of design elements and functionalities, resulting in well-rounded and successful mobile applications.", image: "GBI", background: "allsaints", logo: "git"),
    
    Experience(index: 8, title: "Visual Merchandising\n           Team Lead", company:  "Urban Outfitters", date: "2014 - 2015", team: "Creative Merchandising", location: "New York, NY", description1Header: "Aesthetic Innovation", description1: "Pioneered innovative and captivating visual merchandising concepts that pushed boundaries and set new industry standards for aesthetics. \n\nThis creative flair seamlessly translates into iOS development by enabling me to design and implement cutting-edge mobile app interfaces that stand out in the competitive digital landscape, delivering both functionality and visual allure.", description2Header: "Project Management", description2: "Successfully orchestrated end-to-end execution of complex store layout redesigns, coordinating tasks, deadlines, and resources to achieve project goals. \n\nThis expertise in project management directly applies to iOS development, allowing me to effectively manage development timelines, collaborate with cross-functional teams, and ensure timely delivery of high-quality applications through efficient project coordination..", description3Header: "Adaptability and Innovation", description3: "Thrived in a fast-paced retail environment, proactively adapting visual strategies to align with evolving market trends and consumer preferences. \n\nThis adaptability lends itself well to iOS development, where I can readily embrace emerging technologies, languages, and frameworks to create forward-looking and innovative mobile applications that provide users with cutting-edge features and functionalities.", image: "anthroVM", background: "urbanoutfitters", logo: "git"),
    
    Experience(index: 9, title: "Stylist Program Director", company:  "Urban Outfitters", date: "2012 - 2014", team: "Public Relations", location: "New York, NY", description1Header: "Program Strategy and Direction", description1: "Integrated current fashion trends, overall brand direction and local market insights into sales-driving styling and merchandising strategies. \n\nThis strategic mindset is transferable to iOS development, enabling me to define clear development goals, plan feature roadmaps, and guide the creation of mobile apps that align with business objectives and user needs.", description2Header: "Collaborative Networking", description2: "Cultivated relationships with stylists and industry professionals to enhance program engagement. \n\nThis networking ability mirrors iOS development, where I can collaborate with developers, designers, and other stakeholders to build relationships that foster effective communication, efficient teamwork, and successful app development.", description3Header: "Event Coordination and Management", description3: "Orchestrated events and initiatives as part of the Stylist Program, ensuring seamless execution and maximum engagement. \n\nThis event management expertise is directly applicable to iOS development, where I can coordinate app launch activities, beta testing, and promotional events to create buzz around the app's release and drive user adoption.", image: "projectManager", background: "urbanoutfitters", logo: "git"),
]

let CommunityHistory: [Community] = [
    Community(index: 1, title: "Senior Director of Public Relations", company: "Snowdays Foundation", date: "2018 - 2023", team: "NONPROFIT", location: "Portland, OR", description1Header: "Strategic Communication Leadership", description1: "Orchestrated comprehensive public relations campaigns for a local nonprofit, fostering community engagement and driving impactful initiatives. \n\nThis skill set aligns seamlessly with iOS development, where I can strategize and communicate effectively with cross-functional teams to ensure the creation of user-centric, innovative, and successful mobile applications.", description2Header: "Cross-Functional Collaboration", description2: "Collaborated with diverse stakeholders, including media, government officials, and community partners, to amplify the nonprofit's mission. \n\nThis collaboration aptitude transfers to iOS development by enabling me to work harmoniously with designers, developers, and QA testers, ensuring efficient teamwork and a smooth development process for exceptional app outcomes.", description3Header: "Data-Driven Impact", description3: "Utilized data analytics to measure PR campaign success, adjust strategies, and maximize nonprofit visibility. \n\nThis analytical prowess translates well to iOS development, where I can utilize analytics tools to assess user engagement, enhance app performance, and iteratively improve user experiences, contributing to apps that make a significant impact in the digital landscape.", image: "snowdaysLogo", background: "snowdays"),
    
    Community(index: 2, title: "Senior Director of Program Development", company: "Snowdays Foundation", date: "2019 - 2020", team: "NONPROFIT", location: "Portland, OR", description1Header: "Strategic Program Innovation", description1: "Directed the development of impactful programs for a local nonprofit, aligning initiatives with community needs and organizational goals. \n\nThis strategic thinking parallels iOS development, where I can creatively innovate and design features that address user needs, enhance user experiences, and contribute to the success of mobile applications.", description2Header: "Cross-Functional Team Leadership", description2: "Led multidisciplinary teams in program creation, fostering collaboration between diverse experts. \n\nThis leadership experience is valuable in iOS development, enabling me to lead development teams, collaborate with designers and testers, and ensure the seamless integration of design and functionality for successful app launches.", description3Header: "Outcome-Oriented Approach", description3: "Emphasized measurable outcomes and social impact in program development, leveraging data to drive continuous improvement. \n\nThis results-driven mindset translates effectively to iOS development, as I can prioritize user feedback, utilize analytics tools, and iterate on app features to create applications that deliver tangible value and user satisfaction.", image: "snowdaysLogo", background: "snowdays"),
    
    Community(index: 3, title: "Board Member", company: "Snowdays Foundation", date: "2015 - 2023", team: "NONPROFIT", location: "Portland, OR", description1Header: "Strategic Governance", description1: "Provided valuable insights and direction as a Board Member for a local nonprofit, shaping its strategic vision and mission alignment. \n\nThis strategic acumen correlates with iOS development, where I can contribute to project planning, feature prioritization, and overall app strategy, ensuring alignment with business objectives and user needs.", description2Header: "Community Partnership Advocacy", description2: "Advocated for the nonprofit's mission within the community, fostering meaningful partnerships and engagement. \n\nThis community-oriented mindset transitions to iOS development, where I can collaborate with stakeholders, developers, and designers to create apps that resonate with users, forming a strong user community around the application.", description3Header: "Informed Decision-Making", description3: "Participated in key decisions through informed analysis and discussions, ensuring the nonprofit's sustainable growth. \n\nThis analytical approach is applicable in iOS development, allowing me to make data-driven decisions, assess app performance, and enhance user experiences based on actionable insights, contributing to the long-term success of mobile applications.", image: "snowdaysLogo", background: "snowdays")
    ]

let VolunteerHistory: [Volunteer] = [
    Volunteer(title: "Volunteer", company: "Somebody's Thinking About You", mission: "MISSION: Fight the stigmas surrounding mental illness in Action Sports by providing ways to educate, navigate, communicate and commiserate all things relating but not limited to anxiety, depression, grief, esteem, addiction, self-harm, suicide ideation and suicide itself.", location: "Portland, OR", image: "somebodysThinkingAboutYou"),
    
    Volunteer(title: "Volunteer", company: "HOLLA Mentorship", mission: "MISSION: Change the narrative of youth of color through culturally responsive relationships. \nHOLLA is a mentorship movement that connects with families, administrators, teachers, and nonprofits to recognize the power and potential of Black, Brown, and Indigenous youth.", location: "Portland, OR", image: "HOLLA"),
    
    Volunteer(title: "Volunteer", company: "Babes On Waves", mission: "MISSION: Empower women with opportunity, skill development, and an inclusive community to strengthen the presence of women surfers locally and abroad. We envision a world where women and girls are uplifted, confident, and equal partners in surf culture.", location: "Portland, OR", image: "babesOnWaves"),
    
    Volunteer(title: "Volunteer", company: "Color Outside the Lines", mission: "MISSION: Empower and inspire foster and at-risk youth by providing opportunities with art, music, movement and creativity.", location: "Portland, OR", image: "colorOutsideTheLines")

]




// MARK: Project Data
struct Project: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var features: [String]
    var details: String
    var technologies: [String]
    var url: String
    var image: String
    var detailImage: String
    var color1: Color
    var color2: Color
}

struct WIPProject {
    var title: String
    var subtitle: String
    var technologies: [String]
    var image: String
//    var color1: Color
//    var color2: Color
}

let sampleProjects: [Project] = [
    Project(index: 1, title: "TabIt: Musician's Ultimate Companion", subtitle: "TabIt is a sophisticated Music Recognition App that seamlessly integrates Guitar Tablature. \n\nExplore a world of musical possibilities as TabIt empowers you to identify songs instantly and access detailed guitar tablature. \n\nWhether you're a beginner or an experienced musician, TabIt's user-friendly interface and robust features make it the perfect companion for your musical journey, all built using SwiftUI.", features: ["Music Recognition: Instantly identify songs using advanced audio recognition powered by the AUDD API.", "Guitar Tablature Integration: Access an extensive collection of guitar tablature to enhance your guitar skills.", "Firebase Integration: Safely store recognized songs in user profiles, with personalized images and settings.", "User Profiles: Customize your experience by creating unique profiles with custom images and display settings.", "Personal Song Library: Build and manage a curated library of recognized songs, simplifying practice and reference.", "Data Security: Prioritize data security with a private environment for your personalized song collection.", "Cross-Platform Syncing: Access saved songs and tablature across devices for consistency in your musical journey.", "User-Friendly Interface: Enjoy an intuitive interface designed for users of all skill levels."], details: "DETAILS", technologies: ["SwiftUI", "AVFoundation", "Firebase", "PhotosPicker"], url: "https://github.com/ZelynaFarrell/TabIt", image: "TabIt", detailImage: "TabItDetail", color1: .teal, color2: .blue),
   
    Project(index: 2, title: "WePlay: Navigating Parenthood with Ease", subtitle: "WePlay is a thoughtful app crafted in SwiftUI and powered by Combine, designed to assist new parents in discovering family-friendly businesses and upcoming events around their GPS coordinates, all powered by the Yelp API.", features: ["Location-Based Discovery: Find family-friendly businesses and events nearby using the Yelp API.", "SwiftUI and Combine: Developed using SwiftUI and Combine for a smooth, reactive user experience.", "Real-Time Updates: Get real-time updates on events and businesses, keeping you informed and ensuring you never miss out on local activities.", "Map Integration: Seamlessly integrate with maps for easy navigation to your destination.", "Calendar Integration: Connect to the user's calendar with pre-filled event details for simplified scheduling.", "Phone Connectivity: Effortlessly connect to businesses with pre-filled phone numbers for easy calling.", "Intuitive Interface: User-friendly design for quick access and memorable family experiences.", "Data Privacy: WePlay ensures data remains secure and protected." ], details: "DETAILS", technologies: ["SwiftUI", "Combine", "EventKit", "MapKit", "CoreLocation"], url: "https://github.com/ZelynaFarrell/WePlay", image: "WePlay", detailImage: "WePlayDetail", color1: .yellow, color2: .orange),
   
    Project(index: 3, title: "Liquid Holographic Action Button", subtitle: "This mini project showcases a captivating and interactive user interface element - a liquid effect action button with a holographic twist. \n\nBuilt using SwiftUI, the application employs CoreMotion to introduce a holographic effect to the UI as the user moves their device.", features: ["Liquid Effect: The action button is surrounded by a fluid-like animation, giving it a mesmerizing and playful appearance.", "Holographic UI: The UI responds to the device's motion, creating a holographic effect that enhances the visual appeal and engagement."], details: "The MotionManager class utilizes CoreMotion to track the device's orientation and motion. The icons view displays a set of icons, such as credit card, key, and face ID symbols, which animate and blur as the action button expands. The circle view generates connecting strokes between the icons, adding to the visual effect of the liquid animation. The motion view produces the holographic effect using gradients and reflections that respond to the device's roll motion. The canvas view utilizes SwiftUI's Canvas to draw circles around the icons, creating the illusion of liquid movement. Interactivity is achieved by tapping the action button, triggering an animation that expands and reveals the icons, enhancing the liquid effect and holographic UI. The use of gradients, blurs, and animations brings depth and dimension to the interface.", technologies: ["SwiftUI", "CoreMotion"], url: "https://github.com/ZelynaFarrell/CustomActionButton", image: "LiquidButton", detailImage: "LiquidButtonDetail", color1: .purple, color2: .indigo),
]

let sampleWIPProjects: [WIPProject] = [
    WIPProject(title: "SyntaxFlow", subtitle: "Learn the Language of Programming", technologies: ["SwiftUI"], image: "innovation"),
    WIPProject(title: "WeatherWonders", subtitle: "Beyond the Forecast", technologies: ["SwiftUI"], image: "anthroVM"),
    WIPProject(title: "BuoyBreaks", subtitle: "Buoy-Driven Surf Tracker", technologies: ["SwiftUI"], image: "GBI")
]




// MARK: Skills Data
struct Skill: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var proficiencyLevel: Double
    var animate: Bool = false
}


var technicalSkills: [Skill] = [
    Skill(title: "Swift", proficiencyLevel: 0.9),
    Skill(title: "SwiftUI", proficiencyLevel: 0.9),
    Skill(title: "UIKit", proficiencyLevel: 0.7),
    Skill(title: "Git", proficiencyLevel: 0.6),
    Skill(title: "GitHub", proficiencyLevel: 0.7),
    Skill(title: "CoreData", proficiencyLevel: 0.6),
    Skill(title: "CocoaPods", proficiencyLevel: 0.8),
    Skill(title: "Firebase", proficiencyLevel: 0.7),
    Skill(title: "Debugging", proficiencyLevel: 0.8),
    Skill(title: "MVVM", proficiencyLevel: 0.9),
    Skill(title: "Authentication", proficiencyLevel: 0.7),
    Skill(title: "Animation",  proficiencyLevel: 0.8),
    Skill(title: "Libraries", proficiencyLevel: 0.9),
    Skill(title: "Networking", proficiencyLevel: 0.8),
    Skill(title: "Memory", proficiencyLevel: 0.7),
    Skill(title: "ARKit", proficiencyLevel: 0.4),
    Skill(title: "CoreGraphics", proficiencyLevel: 0.6),
    Skill(title: "MapKit", proficiencyLevel: 0.8),
    Skill(title: "CoreLocation", proficiencyLevel: 0.8),
    Skill(title: "Performance", proficiencyLevel: 0.7),
    Skill(title: "UI/UX", proficiencyLevel: 0.9),
    Skill(title: "Threading", proficiencyLevel: 0.7),
    Skill(title: "Notifications", proficiencyLevel: 0.6)
]

var softSkills: [Skill] = [
    Skill(title: "Collaboration", proficiencyLevel: 0.8),
    Skill(title: "Empathy", proficiencyLevel: 0.9),
    Skill(title: "Communication", proficiencyLevel: 0.8),
    Skill(title: "Goal Setting", proficiencyLevel: 0.9),
    Skill(title: "Creativity", proficiencyLevel: 0.8),
    Skill(title: "Analytical", proficiencyLevel: 0.7),
    Skill(title: "Resilience", proficiencyLevel: 0.9),
    Skill(title: "Leadership", proficiencyLevel: 0.8),
    Skill(title: "User Focused", proficiencyLevel: 0.7),
    Skill(title: "Initiative", proficiencyLevel: 0.8),
    Skill(title: "Adaptability", proficiencyLevel: 0.7),
    Skill(title: "Multi-tasking", proficiencyLevel: 0.8),
    Skill(title: "Flexibility", proficiencyLevel: 0.7),
    Skill(title: "Self-Discipline", proficiencyLevel: 0.9),
    Skill(title: "Team Building", proficiencyLevel: 0.8),
    Skill(title: "Organization", proficiencyLevel: 0.9),
    Skill(title: "Patience", proficiencyLevel: 0.7),
    Skill(title: "Innovative", proficiencyLevel: 0.8),
    Skill(title: "Integrity", proficiencyLevel: 0.9),
    Skill(title: "Positivity", proficiencyLevel: 0.9),
    Skill(title: "Detail Oriented", proficiencyLevel: 0.9)
]



// MARK: Education Data
struct Education {
    var course: String
    var institution: String
    var date: String
    var image: String
    var logo: String
    var animate: Bool = false
    
}

var educationHistory: [Education] = [
    Education(course: "The Complete iOS App Development bootcamp", institution: "Dr. Angela Yu", date: "2020", image: "DrAngelaYu", logo: "SwiftLogo"),
    Education(course: "100 days of Swift", institution: "Hacking with Swift \nPaul Hudson", date: "2021", image: "hacking", logo: "SwiftLogo"),
    Education(course: "100 days of SwiftUI", institution: "Hacking with Swift \nPaul Hudson", date: "2022", image: "hackingwithswift", logo: "SwiftLogo"),
    Education(course: "Advanced Development \nin SwiftUI", institution: "DesignCode \nSai Kambampati", date: "2023", image: "designcodecourse", logo: "SwiftLogo"),
]

var continuedEducation: [Education] = [
    Education(course: "Advanced iOS", institution: "Hacking with Swift+", date: "current", image: "hacking", logo: "SwiftLogo"),
    Education(course: "iOS Dev Training", institution: "Apple.Developer", date: "current", image: "apple", logo: "SwiftLogo"),
]

//struct DeveloperData {
//    var experience: [Experience]
//    var projects: [Project]
//    var skills: [Skill]
//    var education: [Education]
//}
//let developerData = DeveloperData(experience: sampleExperience, projects: sampleProjects, skills: sampleSkills, education: sampleEducation)


