CREATE DATABASE IF NOT EXISTS tn_tour;
USE tn_tour;

-- =====================================================
-- USERS
-- =====================================================

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    password VARCHAR(255) NOT NULL,
    profile_image VARCHAR(255),
    status VARCHAR(30) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- DISTRICTS
-- =====================================================

CREATE TABLE districts (
    district_id INT AUTO_INCREMENT PRIMARY KEY,
    district_name VARCHAR(100) NOT NULL UNIQUE,
    region VARCHAR(50),
    headquarters VARCHAR(100),
    famous_places TEXT
);

-- =====================================================
-- TOURIST PLACES
-- =====================================================

CREATE TABLE tourist_places (

    place_id INT AUTO_INCREMENT PRIMARY KEY,

    district_id INT NOT NULL,

    place_name VARCHAR(150) NOT NULL,

    category VARCHAR(100),

    description TEXT,

    best_season VARCHAR(50),

    opening_time TIME,

    closing_time TIME,

    entry_fee DECIMAL(10,2) DEFAULT 0.00,

    latitude DECIMAL(10,7),

    longitude DECIMAL(10,7),

    image VARCHAR(255),

    rating DECIMAL(2,1) DEFAULT 0.0,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_place_district
        FOREIGN KEY (district_id)
        REFERENCES districts(district_id)
);

-- =====================================================
-- HERITAGE SITES
-- =====================================================

CREATE TABLE heritage_sites (

    heritage_id INT AUTO_INCREMENT PRIMARY KEY,

    district_id INT NOT NULL,

    place_id INT NOT NULL,

    heritage_name VARCHAR(150) NOT NULL,

    heritage_type VARCHAR(100),

    unesco_status VARCHAR(50),

    built_year VARCHAR(50),

    dynasty VARCHAR(100),

    history TEXT,

    image VARCHAR(255),

    latitude DECIMAL(10,7),

    longitude DECIMAL(10,7),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_heritage_district
        FOREIGN KEY (district_id)
        REFERENCES districts(district_id),

    CONSTRAINT fk_heritage_place
        FOREIGN KEY (place_id)
        REFERENCES tourist_places(place_id)
);

-- =====================================================
-- HANDICRAFTS
-- =====================================================

CREATE TABLE handicrafts (

    craft_id INT AUTO_INCREMENT PRIMARY KEY,

    district_id INT NOT NULL,

    craft_name VARCHAR(150) NOT NULL,

    craft_type VARCHAR(100),

    material VARCHAR(100),

    description TEXT,

    history TEXT,

    image VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_handicraft_district
        FOREIGN KEY (district_id)
        REFERENCES districts(district_id)
);

-- =====================================================
-- HOTELS
-- =====================================================

CREATE TABLE hotels (

    hotel_id INT AUTO_INCREMENT PRIMARY KEY,

    district_id INT NOT NULL,

    place_id INT,

    hotel_name VARCHAR(150) NOT NULL,

    hotel_type VARCHAR(50),

    star_rating DECIMAL(2,1),

    address TEXT,

    city VARCHAR(100),

    phone VARCHAR(20),

    email VARCHAR(100),

    website VARCHAR(255),

    booking_link VARCHAR(255),

    price_per_night DECIMAL(10,2),

    amenities TEXT,

    image VARCHAR(255),

    latitude DECIMAL(10,7),

    longitude DECIMAL(10,7),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_hotel_district
        FOREIGN KEY (district_id)
        REFERENCES districts(district_id),

    CONSTRAINT fk_hotel_place
        FOREIGN KEY (place_id)
        REFERENCES tourist_places(place_id)
);
-- =====================================================
-- RESTAURANTS
-- =====================================================

CREATE TABLE restaurants (

    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,

    district_id INT NOT NULL,

    place_id INT,

    restaurant_name VARCHAR(150) NOT NULL,

    cuisine_type VARCHAR(100),

    address TEXT,

    phone VARCHAR(20),

    email VARCHAR(100),

    website VARCHAR(255),

    opening_time TIME,

    closing_time TIME,

    average_cost DECIMAL(10,2),

    rating DECIMAL(2,1),

    image VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_restaurant_district
        FOREIGN KEY (district_id)
        REFERENCES districts(district_id),

    CONSTRAINT fk_restaurant_place
        FOREIGN KEY (place_id)
        REFERENCES tourist_places(place_id)
);

-- =====================================================
-- EVENTS
-- =====================================================

CREATE TABLE events (

    event_id INT AUTO_INCREMENT PRIMARY KEY,

    district_id INT NOT NULL,

    place_id INT,

    event_name VARCHAR(150) NOT NULL,

    event_type VARCHAR(100),

    description TEXT,

    event_date DATE,

    start_time TIME,

    end_time TIME,

    venue VARCHAR(150),

    ticket_price DECIMAL(10,2) DEFAULT 0.00,

    image VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_event_district
        FOREIGN KEY (district_id)
        REFERENCES districts(district_id),

    CONSTRAINT fk_event_place
        FOREIGN KEY (place_id)
        REFERENCES tourist_places(place_id)
);

-- =====================================================
-- TRANSPORT
-- =====================================================

CREATE TABLE transport (

    transport_id INT AUTO_INCREMENT PRIMARY KEY,

    district_id INT NOT NULL,

    transport_type VARCHAR(50),

    service_name VARCHAR(150),

    source VARCHAR(150),

    destination VARCHAR(150),

    contact_number VARCHAR(20),

    description TEXT,

    verified TINYINT(1) DEFAULT 0,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_transport_district
        FOREIGN KEY (district_id)
        REFERENCES districts(district_id)
);

-- =====================================================
-- FEEDBACK
-- =====================================================

CREATE TABLE feedback (

    feedback_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,

    place_id INT NOT NULL,

    rating INT,

    comments TEXT,

    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_feedback_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    CONSTRAINT fk_feedback_place
        FOREIGN KEY (place_id)
        REFERENCES tourist_places(place_id)
);

-- =====================================================
-- FAVORITES
-- =====================================================

CREATE TABLE favorites (

    favorite_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,

    place_id INT NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_favorite_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    CONSTRAINT fk_favorite_place
        FOREIGN KEY (place_id)
        REFERENCES tourist_places(place_id)
);

-- =====================================================
-- SEARCH HISTORY
-- =====================================================

CREATE TABLE search_history (

    search_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,

    search_keyword VARCHAR(255),

    search_type VARCHAR(100),

    search_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_search_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
);
-- =====================================================
-- AI RECOMMENDATIONS
-- =====================================================

CREATE TABLE ai_recommendations (

    recommendation_id INT AUTO_INCREMENT PRIMARY KEY,

    district_id INT NOT NULL,

    recommendation_title VARCHAR(150) NOT NULL,

    recommendation TEXT NOT NULL,

    travel_type VARCHAR(100),

    best_time_to_visit VARCHAR(100),

    estimated_budget VARCHAR(100),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_ai_district
        FOREIGN KEY (district_id)
        REFERENCES districts(district_id)
);

-- =====================================================
-- GALLERIES
-- =====================================================

CREATE TABLE galleries (

    district_id INT NOT NULL,

    place_id INT,

    image_title VARCHAR(150),

    image_path VARCHAR(255) NOT NULL,

    description TEXT,

    CONSTRAINT fk_gallery_district
        FOREIGN KEY (district_id)
        REFERENCES districts(district_id),

    CONSTRAINT fk_gallery_place
        FOREIGN KEY (place_id)
        REFERENCES tourist_places(place_id)
);

-- =====================================================
-- BOOKINGS
-- =====================================================

CREATE TABLE bookings (

    booking_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,

    hotel_id INT NOT NULL,

    check_in DATE,

    check_out DATE,

    guests INT DEFAULT 1,

    total_amount DECIMAL(10,2),

    booking_status VARCHAR(30) DEFAULT 'Pending',

    booked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    CONSTRAINT fk_booking_hotel
        FOREIGN KEY (hotel_id)
        REFERENCES hotels(hotel_id)
);

-- =====================================================
-- ADMIN LOGS
-- =====================================================

CREATE TABLE admin_logs (

    log_id INT AUTO_INCREMENT PRIMARY KEY,

    admin_id INT,

    action VARCHAR(255),

    action_details TEXT,

    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_admin_user
        FOREIGN KEY (admin_id)
        REFERENCES users(user_id)
);

-- =====================================================
-- DATABASE CREATED SUCCESSFULLY
-- =====================================================
INSERT INTO users
(role_id, full_name, email, phone, password, profile_image, status, created_at)
VALUES
(1,'Admin User','admin@tntours.com','9876543210','admin123','admin.jpg','Active','2026-08-01 09:00:00'),
(2,'Arun Kumar','arun1@gmail.com','9876543211','user123','user1.jpg','Active','2026-08-01 09:10:00'),
(2,'Priya Devi','priya2@gmail.com','9876543212','user123','user2.jpg','Active','2026-08-01 09:20:00'),
(2,'Karthik Raj','karthik3@gmail.com','9876543213','user123','user3.jpg','Active','2026-08-01 09:30:00'),
(2,'Divya Sri','divya4@gmail.com','9876543214','user123','user4.jpg','Active','2026-08-01 09:40:00'),
(2,'Vignesh Kumar','vignesh5@gmail.com','9876543215','user123','user5.jpg','Active','2026-08-01 09:50:00'),
(2,'Nandhini','nandhini6@gmail.com','9876543216','user123','user6.jpg','Active','2026-08-01 10:00:00'),
(2,'Surya Prakash','surya7@gmail.com','9876543217','user123','user7.jpg','Active','2026-08-01 10:10:00'),
(2,'Harini','harini8@gmail.com','9876543218','user123','user8.jpg','Active','2026-08-01 10:20:00'),
(2,'Ramesh','ramesh9@gmail.com','9876543219','user123','user9.jpg','Active','2026-08-01 10:30:00'),
(2,'Sathish','sathish10@gmail.com','9876543220','user123','user10.jpg','Active','2026-08-01 10:40:00'),
(2,'Keerthana','keerthana11@gmail.com','9876543221','user123','user11.jpg','Active','2026-08-01 10:50:00'),
(2,'Manoj','manoj12@gmail.com','9876543222','user123','user12.jpg','Active','2026-08-01 11:00:00'),
(2,'Anitha','anitha13@gmail.com','9876543223','user123','user13.jpg','Active','2026-08-01 11:10:00'),
(2,'Rahul','rahul14@gmail.com','9876543224','user123','user14.jpg','Active','2026-08-01 11:20:00'),
(2,'Lakshmi','lakshmi15@gmail.com','9876543225','user123','user15.jpg','Active','2026-08-01 11:30:00'),
(2,'Gokul','gokul16@gmail.com','9876543226','user123','user16.jpg','Active','2026-08-01 11:40:00'),
(2,'Meena','meena17@gmail.com','9876543227','user123','user17.jpg','Active','2026-08-01 11:50:00'),
(2,'Ajith','ajith18@gmail.com','9876543228','user123','user18.jpg','Active','2026-08-01 12:00:00'),
(2,'Shalini','shalini19@gmail.com','9876543229','user123','user19.jpg','Active','2026-08-01 12:10:00'),
(2,'Praveen','praveen20@gmail.com','9876543230','user123','user20.jpg','Active','2026-08-01 12:20:00'),
(2,'Deepa','deepa21@gmail.com','9876543231','user123','user21.jpg','Active','2026-08-01 12:30:00'),
(2,'Suresh','suresh22@gmail.com','9876543232','user123','user22.jpg','Active','2026-08-01 12:40:00'),
(2,'Kavitha','kavitha23@gmail.com','9876543233','user123','user23.jpg','Active','2026-08-01 12:50:00'),
(2,'Aravind','aravind24@gmail.com','9876543234','user123','user24.jpg','Active','2026-08-01 13:00:00'),
(2,'Bhavani','bhavani25@gmail.com','9876543235','user123','user25.jpg','Active','2026-08-01 13:10:00'),
(2,'Santhosh','santhosh26@gmail.com','9876543236','user123','user26.jpg','Active','2026-08-01 13:20:00'),
(2,'Revathi','revathi27@gmail.com','9876543237','user123','user27.jpg','Active','2026-08-01 13:30:00'),
(2,'Naveen','naveen28@gmail.com','9876543238','user123','user28.jpg','Active','2026-08-01 13:40:00'),
(2,'Janani','janani29@gmail.com','9876543239','user123','user29.jpg','Active','2026-08-01 13:50:00'),
(2,'Dinesh','dinesh30@gmail.com','9876543240','user123','user30.jpg','Active','2026-08-01 14:00:00'),
(2,'Monisha','monisha31@gmail.com','9876543241','user123','user31.jpg','Active','2026-08-01 14:10:00'),
(2,'Hari','hari32@gmail.com','9876543242','user123','user32.jpg','Active','2026-08-01 14:20:00'),
(2,'Swathi','swathi33@gmail.com','9876543243','user123','user33.jpg','Active','2026-08-01 14:30:00'),
(2,'Mohan','mohan34@gmail.com','9876543244','user123','user34.jpg','Active','2026-08-01 14:40:00'),
(2,'Pavithra','pavithra35@gmail.com','9876543245','user123','user35.jpg','Active','2026-08-01 14:50:00'),
(2,'Kishore','kishore36@gmail.com','9876543246','user123','user36.jpg','Active','2026-08-01 15:00:00'),
(2,'Aishwarya','aish37@gmail.com','9876543247','user123','user37.jpg','Active','2026-08-01 15:10:00'),
(2,'Vasanth','vasanth38@gmail.com','9876543248','user123','user38.jpg','Active','2026-08-01 15:20:00'),
(2,'Sneha','sneha39@gmail.com','9876543249','user123','user39.jpg','Active','2026-08-01 15:30:00'),
(2,'Yuvaraj','yuvaraj40@gmail.com','9876543250','user123','user40.jpg','Active','2026-08-01 15:40:00'),
(2,'Hemalatha','hema41@gmail.com','9876543251','user123','user41.jpg','Active','2026-08-01 15:50:00'),
(2,'Rohit','rohit42@gmail.com','9876543252','user123','user42.jpg','Active','2026-08-01 16:00:00'),
(2,'Nisha','nisha43@gmail.com','9876543253','user123','user43.jpg','Active','2026-08-01 16:10:00'),
(2,'Balaji','balaji44@gmail.com','9876543254','user123','user44.jpg','Active','2026-08-01 16:20:00'),
(2,'Gayathri','gayathri45@gmail.com','9876543255','user123','user45.jpg','Active','2026-08-01 16:30:00'),
(2,'Prakash','prakash46@gmail.com','9876543256','user123','user46.jpg','Active','2026-08-01 16:40:00'),
(2,'Sindhu','sindhu47@gmail.com','9876543257','user123','user47.jpg','Active','2026-08-01 16:50:00'),
(2,'Vinoth','vinoth48@gmail.com','9876543258','user123','user48.jpg','Active','2026-08-01 17:00:00'),
(2,'Abinaya','abinaya49@gmail.com','9876543259','user123','user49.jpg','Active','2026-08-01 17:10:00'),
(2,'Kavin','kavin50@gmail.com','9876543260','user123','user50.jpg','Active','2026-08-01 17:20:00');

INSERT INTO districts
(district_name, region, headquarters, famous_places)
VALUES
('Ariyalur','Central','Ariyalur','Gangaikonda Cholapuram Temple'),
('Chengalpattu','North','Chengalpattu','Mahabalipuram, Kovalam Beach'),
('Chennai','North','Chennai','Marina Beach, Fort St. George'),
('Coimbatore','West','Coimbatore','Marudamalai Temple, VOC Park'),
('Cuddalore','East','Cuddalore','Silver Beach, Pichavaram'),
('Dharmapuri','North-West','Dharmapuri','Hogenakkal Falls'),
('Dindigul','South','Dindigul','Kodaikanal, Dindigul Fort'),
('Erode','West','Erode','Bhavani Sangameswarar Temple'),
('Kallakurichi','North','Kallakurichi','Kalvarayan Hills'),
('Kanchipuram','North','Kanchipuram','Ekambareswarar Temple, Kailasanathar Temple'),
('Kanyakumari','South','Nagercoil','Vivekananda Rock Memorial, Thiruvalluvar Statue'),
('Karur','Central','Karur','Pasupathieswarar Temple'),
('Krishnagiri','North-West','Krishnagiri','Krishnagiri Dam'),
('Madurai','South','Madurai','Meenakshi Amman Temple'),
('Mayiladuthurai','East','Mayiladuthurai','Mayuranathaswamy Temple'),
('Nagapattinam','East','Nagapattinam','Velankanni Basilica'),
('Namakkal','West','Namakkal','Namakkal Fort'),
('Nilgiris','West','Udhagamandalam','Ooty Botanical Garden'),
('Perambalur','Central','Perambalur','Ranjankudi Fort'),
('Pudukkottai','Central','Pudukkottai','Sittannavasal Cave'),
('Ramanathapuram','South','Ramanathapuram','Pamban Bridge'),
('Ranipet','North','Ranipet','Arcot'),
('Salem','West','Salem','Yercaud'),
('Sivaganga','South','Sivaganga','Chettinad'),
('Tenkasi','South','Tenkasi','Courtallam Falls'),
('Thanjavur','Central','Thanjavur','Brihadeeswarar Temple'),
('Theni','South','Theni','Meghamalai'),
('Thoothukudi','South','Thoothukudi','Tuticorin Port'),
('Tiruchirappalli','Central','Tiruchirappalli','Rockfort Temple, Srirangam'),
('Tirunelveli','South','Tirunelveli','Nellaiappar Temple'),
('Tirupathur','North','Tirupathur','Yelagiri Hills'),
('Tiruppur','West','Tiruppur','Avinashi Temple'),
('Tiruvallur','North','Tiruvallur','Pulicat Lake'),
('Tiruvannamalai','North','Tiruvannamalai','Arunachaleswarar Temple'),
('Tiruvarur','Central','Tiruvarur','Thyagaraja Temple'),
('Vellore','North','Vellore','Vellore Fort'),
('Viluppuram','North','Viluppuram','Gingee Fort'),
('Virudhunagar','South','Virudhunagar','Srivilliputhur Temple');

INSERT INTO tourist_places
(district_id, place_name, category, description, best_season, opening_time, closing_time, entry_fee, latitude, longitude, image, rating)
VALUES
(1,'Gangaikonda Cholapuram Temple','Temple','UNESCO heritage Chola temple.','Nov-Feb','06:00:00','18:00:00',50.00,11.2075,79.4533,'gangaikonda.jpg',4.8),
(2,'Mahabalipuram Shore Temple','Heritage','Ancient Pallava monument.','Nov-Feb','06:00:00','18:00:00',40.00,12.6208,80.1931,'shore_temple.jpg',4.9),
(3,'Marina Beach','Beach','Longest urban beach in India.','Nov-Feb','00:00:00','23:59:00',0.00,13.0500,80.2824,'marina.jpg',4.7),
(4,'Marudamalai Temple','Temple','Hill temple of Lord Murugan.','Oct-Mar','05:30:00','20:00:00',20.00,11.0456,76.8615,'marudamalai.jpg',4.8),
(5,'Silver Beach','Beach','Beautiful beach in Cuddalore.','Nov-Feb','06:00:00','18:30:00',0.00,11.7000,79.7700,'silver_beach.jpg',4.5),
(6,'Hogenakkal Falls','Waterfall','Famous waterfalls of Tamil Nadu.','Jul-Feb','08:00:00','17:00:00',30.00,12.1196,77.7750,'hogenakkal.jpg',4.8),
(7,'Kodaikanal Lake','Hill Station','Popular boating destination.','Sep-May','08:00:00','18:00:00',20.00,10.2381,77.4892,'kodaikanal_lake.jpg',4.9),
(8,'Bhavani Sangameswarar Temple','Temple','Temple at river confluence.','Oct-Mar','06:00:00','20:00:00',10.00,11.4500,77.6833,'bhavani.jpg',4.7),
(9,'Kalvarayan Hills','Hill Station','Scenic hill range.','Oct-Feb','06:00:00','18:00:00',0.00,11.6500,78.9500,'kalvarayan.jpg',4.5),
(10,'Ekambareswarar Temple','Temple','One of Pancha Bhoota temples.','Nov-Feb','05:30:00','21:00:00',20.00,12.8342,79.7036,'ekambareswarar.jpg',4.9),
(11,'Vivekananda Rock Memorial','Monument','Famous memorial in Kanyakumari.','Oct-Mar','07:00:00','16:00:00',50.00,8.0780,77.5540,'vivekananda.jpg',4.9),
(12,'Pasupathieswarar Temple','Temple','Historic Shiva temple.','Nov-Feb','06:00:00','20:00:00',10.00,10.9577,78.0809,'pasupathi.jpg',4.6),
(13,'Krishnagiri Dam','Dam','Popular picnic spot.','Jul-Jan','08:00:00','18:00:00',10.00,12.5300,78.2200,'krishnagiri_dam.jpg',4.5),
(14,'Meenakshi Amman Temple','Temple','World-famous temple in Madurai.','Oct-Mar','05:00:00','21:30:00',50.00,9.9195,78.1193,'meenakshi.jpg',5.0),
(15,'Mayuranathaswamy Temple','Temple','Ancient Shiva temple.','Nov-Feb','06:00:00','20:00:00',10.00,11.1000,79.6500,'mayuranathar.jpg',4.7),
(16,'Velankanni Basilica','Church','Popular pilgrimage centre.','Nov-Feb','05:00:00','21:00:00',0.00,10.6825,79.8528,'velankanni.jpg',4.9),
(17,'Namakkal Fort','Fort','Historic hill fort.','Oct-Feb','08:00:00','17:00:00',20.00,11.2200,78.1700,'namakkal_fort.jpg',4.5),
(18,'Government Botanical Garden','Garden','Famous botanical garden in Ooty.','Apr-Jun','08:00:00','18:30:00',50.00,11.4102,76.6950,'ooty_garden.jpg',4.8),
(19,'Ranjankudi Fort','Fort','Historic military fort.','Oct-Feb','09:00:00','17:00:00',20.00,11.2300,78.8800,'ranjankudi.jpg',4.3),
(20,'Sittannavasal Cave','Heritage','Ancient Jain cave paintings.','Nov-Feb','09:00:00','17:00:00',25.00,10.4600,78.7300,'sittannavasal.jpg',4.7);
INSERT INTO tourist_places
(district_id, place_name, category, description, best_season, opening_time, closing_time, entry_fee, latitude, longitude, image, rating)
VALUES
(21,'Pamban Bridge','Bridge','India''s first sea bridge connecting Rameswaram.','Oct-Mar','00:00:00','23:59:00',0.00,9.2876,79.2066,'pamban_bridge.jpg',4.8),
(21,'Ramanathaswamy Temple','Temple','Famous Jyotirlinga temple in Rameswaram.','Oct-Mar','05:00:00','21:00:00',50.00,9.2881,79.3174,'ramanathaswamy.jpg',5.0),
(22,'Arcot Fort','Fort','Historic fort built during the Carnatic period.','Nov-Feb','09:00:00','17:00:00',20.00,12.9050,79.3200,'arcot_fort.jpg',4.3),
(23,'Yercaud Lake','Hill Station','Beautiful lake surrounded by hills.','Oct-May','08:00:00','18:00:00',20.00,11.7753,78.2090,'yercaud_lake.jpg',4.7),
(23,'Pagoda Point','View Point','Scenic viewpoint overlooking Yercaud.','Oct-May','06:00:00','18:30:00',0.00,11.7890,78.2050,'pagoda_point.jpg',4.6),
(24,'Chettinad Palace','Heritage','Traditional Chettinad architecture.','Nov-Feb','09:00:00','17:00:00',30.00,10.1680,78.7980,'chettinad_palace.jpg',4.8),
(25,'Courtallam Main Falls','Waterfall','Popular medicinal waterfall.','Jun-Sep','06:00:00','18:00:00',10.00,8.9293,77.2778,'courtallam.jpg',4.8),
(25,'Old Courtallam Falls','Waterfall','Peaceful waterfall near Main Falls.','Jun-Sep','06:00:00','18:00:00',10.00,8.9310,77.2790,'old_courtallam.jpg',4.5),
(26,'Brihadeeswarar Temple','UNESCO Heritage','Great Living Chola Temple.','Oct-Mar','06:00:00','20:30:00',50.00,10.7828,79.1318,'big_temple.jpg',5.0),
(26,'Thanjavur Palace','Palace','Historic Maratha palace.','Oct-Mar','09:00:00','17:30:00',50.00,10.7865,79.1388,'thanjavur_palace.jpg',4.6),
(27,'Meghamalai','Hill Station','Beautiful mountain range and tea estates.','Sep-May','06:00:00','18:00:00',0.00,9.6820,77.3950,'meghamalai.jpg',4.9),
(27,'Suruli Falls','Waterfall','Famous waterfall near Cumbum.','Jul-Jan','08:00:00','17:30:00',20.00,9.6580,77.2670,'suruli_falls.jpg',4.6),
(28,'Tuticorin Port','Port','Major seaport of Tamil Nadu.','All Season','09:00:00','17:00:00',0.00,8.7642,78.1348,'tuticorin_port.jpg',4.4),
(28,'Our Lady of Snows Basilica','Church','Historic Roman Catholic church.','Nov-Feb','06:00:00','20:00:00',0.00,8.8055,78.1475,'snows_basilica.jpg',4.7),
(29,'Rockfort Temple','Temple','Historic hilltop temple.','Oct-Mar','06:00:00','20:00:00',30.00,10.8262,78.6928,'rockfort.jpg',4.8),
(29,'Srirangam Temple','Temple','Largest functioning Hindu temple.','Oct-Mar','06:00:00','21:00:00',20.00,10.8625,78.6921,'srirangam.jpg',5.0),
(30,'Nellaiappar Temple','Temple','Ancient temple with musical pillars.','Oct-Mar','05:30:00','20:30:00',20.00,8.7274,77.6845,'nellaiappar.jpg',4.9),
(31,'Yelagiri Hills','Hill Station','Popular weekend hill station.','Sep-May','06:00:00','18:00:00',0.00,12.5700,78.6400,'yelagiri.jpg',4.6),
(32,'Avinashi Temple','Temple','Historic Shiva temple.','Nov-Feb','06:00:00','20:00:00',10.00,11.1900,77.2700,'avinashi.jpg',4.5),
(33,'Pulicat Lake','Lake','Second largest brackish water lake in India.','Nov-Feb','06:00:00','18:00:00',0.00,13.4200,80.3200,'pulicat_lake.jpg',4.6),
(34,'Arunachaleswarar Temple','Temple','Famous Shiva temple in Tiruvannamalai.','Nov-Feb','05:00:00','21:00:00',20.00,12.2253,79.0747,'arunachaleswarar.jpg',5.0),
(34,'Ramana Ashram','Ashram','Spiritual centre founded by Ramana Maharshi.','All Season','08:00:00','18:00:00',0.00,12.2305,79.0684,'ramana_ashram.jpg',4.8),
(35,'Thyagaraja Temple','Temple','Famous temple dedicated to Lord Shiva.','Nov-Feb','06:00:00','20:00:00',10.00,10.7720,79.6360,'thyagaraja.jpg',4.6),
(36,'Vellore Fort','Fort','16th-century granite fort.','Oct-Mar','09:00:00','17:00:00',30.00,12.9165,79.1325,'vellore_fort.jpg',4.7),
(36,'Golden Temple','Temple','Sripuram Golden Temple.','All Season','08:00:00','20:00:00',0.00,12.8406,79.1424,'golden_temple.jpg',4.9),
(37,'Gingee Fort','Fort','Known as the Troy of the East.','Oct-Feb','09:00:00','17:00:00',30.00,12.2520,79.4170,'gingee_fort.jpg',4.8),
(37,'Pichavaram Mangrove Forest','Nature','Famous mangrove forest boating.','Nov-Feb','08:00:00','17:00:00',100.00,11.4300,79.7900,'pichavaram.jpg',4.8),
(38,'Srivilliputhur Andal Temple','Temple','Historic temple dedicated to Andal.','Nov-Feb','05:30:00','20:30:00',10.00,9.5125,77.6340,'andal_temple.jpg',4.9),
(38,'Ayyanar Falls','Waterfall','Scenic waterfall near Rajapalayam.','Jul-Jan','08:00:00','17:00:00',20.00,9.4560,77.5550,'ayyanar_falls.jpg',4.6),
(3,'Guindy National Park','Wildlife','Protected national park in Chennai.','Nov-Feb','09:00:00','17:30:00',30.00,13.0067,80.2295,'guindy_park.jpg',4.5);

INSERT INTO heritage_sites
(district_id, place_id, heritage_name, heritage_type, unesco_status, built_year, dynasty, history, image, latitude, longitude)
VALUES
(1,1,'Gangaikonda Cholapuram Temple','Temple','UNESCO','1035 AD','Chola','Built by Rajendra Chola I.','gangaikonda.jpg',11.2075,79.4533),
(2,2,'Shore Temple','Temple','UNESCO','700 AD','Pallava','Ancient Shore Temple at Mahabalipuram.','shore_temple.jpg',12.6208,80.1931),
(3,3,'Fort St. George','Fort','No','1644','British','First English fortress in India.','fort_st_george.jpg',13.0827,80.2870),
(4,4,'Marudamalai Temple','Temple','No','1200 AD','Pandya','Ancient Murugan temple.','marudamalai.jpg',11.0456,76.8615),
(5,5,'Fort St. David','Fort','No','1690','British','Historic colonial fort.','fort_st_david.jpg',11.7430,79.7680),
(6,6,'Adhiyamankottai Fort','Fort','No','1300 AD','Adhiyaman','Historic hill fort.','adhiyaman.jpg',12.1277,78.1570),
(7,7,'Dindigul Fort','Fort','No','1605','Nayak','Historic granite hill fort.','dindigul_fort.jpg',10.3673,77.9803),
(8,8,'Bhavani Temple','Temple','No','900 AD','Chola','Temple at river confluence.','bhavani.jpg',11.4450,77.6820),
(9,9,'Kalvarayan Hills Heritage','Hill','No','Ancient','Tribal','Traditional tribal heritage.','kalvarayan.jpg',11.6500,78.9500),
(10,10,'Ekambareswarar Temple','Temple','No','600 AD','Pallava','One of Pancha Bhoota temples.','ekambareswarar.jpg',12.8342,79.7036),
(11,11,'Vivekananda Rock Memorial','Monument','No','1970','Modern','Built in memory of Swami Vivekananda.','vivekananda.jpg',8.0780,77.5540),
(12,12,'Pasupathieswarar Temple','Temple','No','800 AD','Chola','Historic Shiva temple.','pasupathi.jpg',10.9577,78.0809),
(13,13,'Krishnagiri Fort','Fort','No','1600 AD','Vijayanagara','Historic military fort.','krishnagiri.jpg',12.5300,78.2200),
(14,14,'Meenakshi Amman Temple','Temple','No','1600 AD','Nayak','Iconic temple of Madurai.','meenakshi.jpg',9.9195,78.1193),
(15,15,'Mayuranathaswamy Temple','Temple','No','900 AD','Chola','Ancient Shiva temple.','mayuranathar.jpg',11.1000,79.6500),
(16,16,'Velankanni Basilica','Church','No','1771','Portuguese','World-famous pilgrimage church.','velankanni.jpg',10.6825,79.8528),
(17,17,'Namakkal Fort','Fort','No','1500 AD','Nayak','Historic hill fort.','namakkal_fort.jpg',11.2200,78.1700),
(18,18,'Stone House Ooty','Colonial Building','No','1822','British','First bungalow in Ooty.','stone_house.jpg',11.4120,76.7030),
(19,19,'Ranjankudi Fort','Fort','No','1600 AD','Nawab','Military fort.','ranjankudi.jpg',11.2300,78.8800),
(20,20,'Sittannavasal Cave','Jain Cave','No','700 AD','Pandya','Ancient Jain cave paintings.','sittannavasal.jpg',10.4600,78.7300),
(21,21,'Pamban Bridge','Bridge','No','1914','British','Historic railway bridge.','pamban.jpg',9.2876,79.2066),
(21,22,'Ramanathaswamy Temple','Temple','No','1200 AD','Pandya','Sacred temple of Rameswaram.','rameswaram.jpg',9.2881,79.3174),
(22,23,'Arcot Fort','Fort','No','1700 AD','Nawab','Historic Arcot fort.','arcot.jpg',12.9050,79.3200),
(23,24,'Yercaud Heritage','Hill Station','No','1800 AD','British','Historic hill station.','yercaud.jpg',11.7753,78.2090),
(24,26,'Chettinad Palace','Palace','No','1902','Chettiar','Traditional Chettinad mansion.','chettinad.jpg',10.1680,78.7980),
(25,27,'Courtallam Heritage','Waterfall','No','Ancient','Pandya','Historic tourist waterfall.','courtallam.jpg',8.9293,77.2778),
(26,29,'Brihadeeswarar Temple','Temple','UNESCO','1010 AD','Chola','Great Living Chola Temple.','big_temple.jpg',10.7828,79.1318),
(26,30,'Thanjavur Palace','Palace','No','1550 AD','Nayak','Royal palace complex.','palace.jpg',10.7865,79.1388),
(27,31,'Meghamalai Heritage','Hill Station','No','Ancient','Local','Tea estate region.','meghamalai.jpg',9.6820,77.3950),
(28,33,'Tuticorin Port Heritage','Port','No','1866','British','Historic seaport.','port.jpg',8.7642,78.1348),
(29,35,'Rockfort Temple','Temple','No','580 AD','Pallava','Rock-cut temple.','rockfort.jpg',10.8262,78.6928),
(29,36,'Srirangam Temple','Temple','No','1000 AD','Chola','Largest functioning Hindu temple.','srirangam.jpg',10.8625,78.6921),
(30,37,'Nellaiappar Temple','Temple','No','700 AD','Pandya','Ancient twin temple.','nellaiappar.jpg',8.7274,77.6845),
(31,38,'Yelagiri Heritage','Hill Station','No','Ancient','Local','Historic hill region.','yelagiri.jpg',12.5700,78.6400),
(32,39,'Avinashi Temple','Temple','No','900 AD','Chola','Ancient Shiva temple.','avinashi.jpg',11.1900,77.2700),
(33,40,'Pulicat Heritage','Lake','No','Ancient','Dutch','Historic trading port.','pulicat.jpg',13.4200,80.3200),
(34,41,'Arunachaleswarar Temple','Temple','No','900 AD','Chola','Sacred temple of Arunachala.','arunachala.jpg',12.2253,79.0747),
(34,42,'Ramana Ashram','Ashram','No','1922','Modern','Spiritual center.','ramana.jpg',12.2305,79.0684),
(35,43,'Thyagaraja Temple','Temple','No','800 AD','Chola','Historic Shiva temple.','thyagaraja.jpg',10.7720,79.6360),
(36,44,'Vellore Fort','Fort','No','1566','Vijayanagara','Massive granite fort.','vellore.jpg',12.9165,79.1325),
(36,45,'Golden Temple','Temple','No','2007','Modern','Golden temple at Sripuram.','golden.jpg',12.8406,79.1424),
(37,46,'Gingee Fort','Fort','No','1200 AD','Chola','Known as the Troy of the East.','gingee.jpg',12.2520,79.4170),
(37,47,'Pichavaram Mangroves','Nature','No','Ancient','Natural','Famous mangrove ecosystem.','pichavaram.jpg',11.4300,79.7900),
(38,48,'Srivilliputhur Temple','Temple','No','800 AD','Pandya','Temple dedicated to Andal.','andal.jpg',9.5125,77.6340),
(38,49,'Ayyanar Falls','Waterfall','No','Ancient','Natural','Scenic waterfall.','ayyanar.jpg',9.4560,77.5550),
(3,50,'Guindy National Park','National Park','No','1976','Government','Protected urban national park.','guindy.jpg',13.0067,80.2295),
(14,14,'Thirumalai Nayakkar Palace','Palace','No','1636','Nayak','Historic royal palace.','nayakkar.jpg',9.9170,78.1230),
(3,28,'Government Museum Chennai','Museum','No','1851','British','One of Indias oldest museums.','museum.jpg',13.0715,80.2560),
(10,32,'Kailasanathar Temple','Temple','No','685 AD','Pallava','Ancient sandstone temple.','kailasanathar.jpg',12.8390,79.6990),
(26,34,'Saraswathi Mahal Library','Library','No','1700 AD','Maratha','Historic royal library.','library.jpg',10.7860,79.1370);

INSERT INTO handicrafts
(district_id, craft_name, craft_type, material, description, history, image)
VALUES

(1,'Ariyalur Stone Sculpture','Stone Craft','Granite',
'Traditional granite stone sculpture.',
'Stone craftsmanship associated with Tamil temple architecture.',
'stone_sculpture.jpg'),

(2,'Mahabalipuram Stone Carving','Stone Craft','Granite',
'World-famous stone carvings from Mahabalipuram.',
'Stone carving flourished during the Pallava period.',
'mahabalapuram_stone.jpg'),

(3,'Chennai Stone Sculpture','Stone Craft','Granite',
'Decorative carved stone sculptures.',
'Traditional Tamil stone craftsmanship.',
'granite.jpg'),

(4,'Coimbatore Cotton Weaving','Textile','Cotton',
'Traditional cotton weaving products.',
'Coimbatore is an important textile centre.',
'cotton_weaving.jpg'),

(5,'Cuddalore Palm Leaf Basket','Basket','Palm Leaf',
'Handmade palm leaf storage baskets.',
'Traditional village handicraft.',
'palm_basket.jpg'),

(6,'Dharmapuri Bamboo Hand Fan','Handicraft','Bamboo',
'Traditional decorative hand fan.',
'Traditional rural handicraft.',
'bamboo_fan.jpg'),

(7,'Dindigul Leather Craft','Leather Craft','Leather',
'Handmade leather products.',
'Dindigul has a tradition of leather-related industries.',
'leather_bag.jpg'),

(8,'Erode Handloom Saree','Textile','Cotton',
'Traditional handwoven cotton sarees.',
'Erode is well known for textile and handloom production.',
'handloom.jpg'),

(9,'Kallakurichi Palm Leaf Basket','Basket','Palm Leaf',
'Handmade traditional baskets.',
'Traditional village handicraft.',
'palm_basket.jpg'),

(10,'Kanchipuram Silk Saree','Silk','Silk',
'Famous handwoven silk sarees.',
'Kanchipuram has a long-established silk weaving tradition.',
'kanchi_silk.jpg'),

(11,'Kanyakumari Palm Leaf Fan','Handicraft','Palm Leaf',
'Eco-friendly traditional hand fan.',
'Traditional village craft.',
'fan.jpg'),

(12,'Karur Handloom Towels','Textile','Cotton',
'Traditional woven cotton towels.',
'Karur is an important home-textile centre.',
'towel.jpg'),

(13,'Krishnagiri Bamboo Basket','Basket','Bamboo',
'Eco-friendly handmade baskets.',
'Traditional rural handicraft.',
'bamboo.jpg'),

(14,'Madurai Sungudi Saree','Textile','Cotton',
'Traditional tie-and-dye cotton saree.',
'Sungudi is a traditional textile craft associated with Madurai.',
'sungudi.jpg'),

(15,'Mayiladuthurai Bronze Idol','Metal Craft','Bronze',
'Traditional bronze religious idols.',
'Traditional temple-art craft of the Cauvery region.',
'bronze.jpg'),

(16,'Nagapattinam Shell Craft','Handicraft','Sea Shell',
'Decorative products made from shells.',
'Traditional coastal craft.',
'shell_craft.jpg'),

(17,'Namakkal Terracotta Horse','Terracotta','Clay',
'Traditional terracotta horse figures.',
'Used traditionally in village and temple craft.',
'terracotta.jpg'),

(18,'Toda Embroidery','Embroidery','Cotton',
'Traditional Toda embroidered textile.',
'Important tribal art of the Nilgiri region.',
'toda.jpg'),

(19,'Perambalur Clay Pottery','Pottery','Clay',
'Handmade traditional clay pots.',
'Traditional pottery craft.',
'pottery.jpg'),

(20,'Pudukkottai Bronze Idol','Metal Craft','Bronze',
'Traditional bronze idols.',
'Traditional South Indian metal casting craft.',
'bronze.jpg'),

(21,'Ramanathapuram Palm Leaf Box','Handicraft','Palm Leaf',
'Decorative palm leaf storage box.',
'Traditional coastal village handicraft.',
'box.jpg'),

(22,'Ranipet Leather Wallet','Leather Craft','Leather',
'Handmade leather wallet.',
'Ranipet region is known for leather industries.',
'wallet.jpg'),

(23,'Salem Cotton Saree','Textile','Cotton',
'Traditional handwoven cotton saree.',
'Salem has a long-standing weaving tradition.',
'cotton_saree.jpg'),

(24,'Sivaganga Chettinad Wooden Door','Wood Craft','Teak',
'Traditional carved wooden door.',
'Chettinad heritage is known for detailed woodwork.',
'door.jpg'),

(25,'Tenkasi Bamboo Basket','Basket','Bamboo',
'Traditional storage basket.',
'Traditional hill-region rural handicraft.',
'cardamom_basket.jpg'),

(26,'Thanjavur Painting','Painting','Gold Foil',
'World-famous traditional Thanjavur paintings.',
'Traditional art developed during the Nayak and Maratha periods.',
'thanjavur_painting.jpg'),

(27,'Theni Bamboo Craft','Handicraft','Bamboo',
'Traditional bamboo handicraft products.',
'Traditional rural craft of the hill region.',
'bamboo.jpg'),

(28,'Thoothukudi Pearl Ornament','Jewellery','Pearl',
'Traditional pearl ornaments.',
'Thoothukudi has a long history associated with pearl fishing.',
'pearl.jpg'),

(29,'Tiruchirappalli Wood Carving','Wood Craft','Teak Wood',
'Decorative traditional wooden carvings.',
'Traditional artisan craftsmanship.',
'wood_carving.jpg'),

(30,'Tirunelveli Wooden Temple','Wood Craft','Wood',
'Miniature traditional wooden temple.',
'Traditional wood carving craft.',
'temple.jpg'),

(31,'Tirupathur Wooden Doll','Toy','Wood',
'Traditional handmade wooden dolls.',
'Traditional rural toy-making craft.',
'doll.jpg'),

(32,'Tiruppur Cotton Bedsheet','Textile','Cotton',
'Handwoven cotton bedsheets.',
'Tiruppur is a major textile and garment centre.',
'bedsheet.jpg'),

(33,'Tiruvallur Bamboo Lamp','Handicraft','Bamboo',
'Decorative eco-friendly bamboo lamp.',
'Traditional and modern bamboo craft.',
'bamboo_lamp.jpg'),

(34,'Tiruvannamalai Clay Idol','Clay Craft','Clay',
'Traditional clay idols.',
'Festival and temple-related handicraft.',
'clay_idol.jpg'),

(35,'Tiruvarur Temple Lamp','Metal Craft','Brass',
'Traditional decorative brass lamp.',
'Traditional temple handicraft.',
'lamp.jpg'),

(36,'Vellore Leather Bag','Leather Craft','Leather',
'Premium handmade leather bags.',
'Vellore region has an established leather industry.',
'vellore_bag.jpg'),

(37,'Viluppuram Wood Toys','Toy','Wood',
'Handmade wooden toys.',
'Traditional village craft.',
'wood_toy.jpg'),

(38,'Virudhunagar Andal Doll','Toy','Wood',
'Traditional Andal-themed doll.',
'Religious and traditional handicraft.',
'andal_doll.jpg'),

(1,'Ariyalur Granite Statue','Stone Craft','Granite',
'Traditional granite statue.',
'Stone craftsmanship associated with Tamil temple architecture.',
'granite.jpg'),

(2,'Chengalpattu Stone Elephant','Stone Craft','Granite',
'Decorative elephant stone carving.',
'Inspired by the Pallava stone-carving tradition.',
'elephant.jpg'),

(3,'Chennai Shell Craft','Handicraft','Shell',
'Decorative shell craft item.',
'Traditional decorative handicraft.',
'shell_lamp.jpg'),

(4,'Coimbatore Cotton Saree','Textile','Cotton',
'Traditional cotton saree.',
'Long-standing textile and weaving tradition.',
'cotton_saree.jpg'),

(5,'Cuddalore Palm Leaf Mat','Handicraft','Palm Leaf',
'Traditional handmade floor mat.',
'Village handicraft tradition.',
'mat.jpg'),

(6,'Dharmapuri Wood Craft','Wood Craft','Wood',
'Traditional decorative wooden item.',
'Rural artisan craft.',
'wood_carving.jpg'),

(7,'Dindigul Leather Wallet','Leather Craft','Leather',
'Handmade leather wallet.',
'Traditional leather-related industry.',
'wallet.jpg'),

(8,'Erode Cotton Bedsheet','Textile','Cotton',
'Handwoven cotton bedsheet.',
'Traditional textile production.',
'bedsheet.jpg'),

(9,'Kallakurichi Bamboo Lamp','Handicraft','Bamboo',
'Decorative bamboo lamp.',
'Eco-friendly rural handicraft.',
'bamboo_lamp.jpg'),

(10,'Kanchipuram Silk Dupatta','Silk','Silk',
'Handwoven silk dupatta.',
'Part of the traditional Kanchipuram silk weaving heritage.',
'dupatta.jpg');

INSERT INTO hotels
(district_id, place_id, hotel_name, hotel_type, star_rating, address, city, phone, email, website, booking_link, price_per_night, amenities, image, latitude, longitude)
VALUES
(1,1,'Ariyalur Residency','Budget',3.0,'Main Road','Ariyalur','9876500001','hotel1@tntours.com','www.ariyalurresidency.com','https://book.com/h1',1800.00,'WiFi,Parking,Restaurant','hotel1.jpg',11.1400,79.0800),
(2,2,'Mahabalipuram Beach Resort','Resort',4.5,'Beach Road','Mahabalipuram','9876500002','hotel2@tntours.com','www.mahabalipuramresort.com','https://book.com/h2',4500.00,'Pool,WiFi,Breakfast','hotel2.jpg',12.6208,80.1931),
(3,3,'Marina Grand Hotel','Luxury',5.0,'Anna Salai','Chennai','9876500003','hotel3@tntours.com','www.marinagrand.com','https://book.com/h3',6500.00,'Pool,Gym,Spa,WiFi','hotel3.jpg',13.0827,80.2707),
(4,4,'Coimbatore Inn','Business',4.0,'Avinashi Road','Coimbatore','9876500004','hotel4@tntours.com','www.coimbatoreinn.com','https://book.com/h4',3800.00,'WiFi,Parking,Gym','hotel4.jpg',11.0168,76.9558),
(5,5,'Silver Beach Hotel','Budget',3.5,'Beach Road','Cuddalore','9876500005','hotel5@tntours.com','www.silverbeachhotel.com','https://book.com/h5',2200.00,'WiFi,Restaurant','hotel5.jpg',11.7500,79.7500),
(6,6,'Hogenakkal Resort','Resort',4.0,'Falls Road','Dharmapuri','9876500006','hotel6@tntours.com','www.hogenakkalresort.com','https://book.com/h6',4000.00,'Pool,WiFi','hotel6.jpg',12.1200,77.7700),
(7,7,'Kodai Lake View','Resort',4.5,'Lake Road','Kodaikanal','9876500007','hotel7@tntours.com','www.kodailakeview.com','https://book.com/h7',5000.00,'Lake View,WiFi','hotel7.jpg',10.2381,77.4892),
(8,8,'Bhavani Comfort','Budget',3.0,'Temple Street','Erode','9876500008','hotel8@tntours.com','www.bhavanicomfort.com','https://book.com/h8',2100.00,'WiFi','hotel8.jpg',11.3400,77.7300),
(9,9,'Kalvarayan Hills Stay','Resort',4.0,'Hill Road','Kallakurichi','9876500009','hotel9@tntours.com','www.kalvarayanstay.com','https://book.com/h9',3500.00,'Parking,WiFi','hotel9.jpg',11.6500,78.9500),
(10,10,'Silk City Hotel','Business',4.0,'Temple Road','Kanchipuram','9876500010','hotel10@tntours.com','www.silkcityhotel.com','https://book.com/h10',3200.00,'WiFi,Breakfast','hotel10.jpg',12.8342,79.7036),
(11,11,'Sunrise Residency','Luxury',5.0,'Beach Road','Kanyakumari','9876500011','hotel11@tntours.com','www.sunrisehotel.com','https://book.com/h11',6200.00,'Pool,Spa,Gym','hotel11.jpg',8.0780,77.5540),
(12,12,'Karur Palace','Business',4.0,'Bus Stand Road','Karur','9876500012','hotel12@tntours.com','www.karurpalace.com','https://book.com/h12',3400.00,'WiFi,Parking','hotel12.jpg',10.9600,78.0800),
(13,13,'Krishnagiri Residency','Budget',3.5,'Main Road','Krishnagiri','9876500013','hotel13@tntours.com','www.krishhotel.com','https://book.com/h13',2500.00,'WiFi','hotel13.jpg',12.5300,78.2200),
(14,14,'Madurai Heritage Hotel','Luxury',5.0,'Temple View','Madurai','9876500014','hotel14@tntours.com','www.maduraiheritage.com','https://book.com/h14',7000.00,'Pool,Spa,Gym','hotel14.jpg',9.9195,78.1193),
(15,15,'Mayiladuthurai Residency','Budget',3.0,'Station Road','Mayiladuthurai','9876500015','hotel15@tntours.com','www.mayilhotel.com','https://book.com/h15',2300.00,'WiFi','hotel15.jpg',11.1000,79.6500),
(16,16,'Velankanni Sea View','Resort',4.5,'Beach Road','Velankanni','9876500016','hotel16@tntours.com','www.seaviewhotel.com','https://book.com/h16',4500.00,'Sea View,Pool','hotel16.jpg',10.6825,79.8528),
(17,17,'Namakkal Residency','Budget',3.0,'Fort Road','Namakkal','9876500017','hotel17@tntours.com','www.namakkalhotel.com','https://book.com/h17',2100.00,'WiFi','hotel17.jpg',11.2200,78.1700),
(18,18,'Ooty Hill Resort','Luxury',5.0,'Botanical Garden Road','Ooty','9876500018','hotel18@tntours.com','www.ootyhillresort.com','https://book.com/h18',6800.00,'Pool,Spa,Gym','hotel18.jpg',11.4102,76.6950),
(19,19,'Perambalur Inn','Budget',3.0,'Main Road','Perambalur','9876500019','hotel19@tntours.com','www.perambalurinn.com','https://book.com/h19',2000.00,'WiFi','hotel19.jpg',11.2300,78.8800),
(20,20,'Pudukkottai Palace','Business',4.0,'City Center','Pudukkottai','9876500020','hotel20@tntours.com','www.pudukkottaihotel.com','https://book.com/h20',3300.00,'Restaurant,WiFi','hotel20.jpg',10.4600,78.7300),
(21,21,'Rameswaram Beach Resort','Resort',4.5,'Beach Road','Rameswaram','9876500021','hotel21@tntours.com','www.rameswaramresort.com','https://book.com/h21',4800.00,'Pool,Sea View','hotel21.jpg',9.2876,79.2066),
(22,23,'Arcot Residency','Budget',3.0,'Main Road','Ranipet','9876500022','hotel22@tntours.com','www.arcothotel.com','https://book.com/h22',2200.00,'WiFi','hotel22.jpg',12.9050,79.3200),
(23,24,'Yercaud Heights','Resort',4.5,'Hill Road','Salem','9876500023','hotel23@tntours.com','www.yercaudheights.com','https://book.com/h23',5200.00,'Pool,Restaurant','hotel23.jpg',11.7753,78.2090),
(24,26,'Chettinad Heritage Stay','Heritage',4.5,'Palace Street','Sivaganga','9876500024','hotel24@tntours.com','www.chettinadstay.com','https://book.com/h24',4900.00,'Traditional Food,WiFi','hotel24.jpg',10.1680,78.7980),
(25,27,'Courtallam Falls Resort','Resort',4.0,'Falls Road','Tenkasi','9876500025','hotel25@tntours.com','www.courtallamresort.com','https://book.com/h25',4300.00,'Pool,WiFi','hotel25.jpg',8.9293,77.2778);
INSERT INTO hotels
(district_id, place_id, hotel_name, hotel_type, star_rating, address, city, phone, email, website, booking_link, price_per_night, amenities, image, latitude, longitude)
VALUES
(26,29,'Thanjavur Royal Residency','Luxury',5.0,'Temple Road','Thanjavur','9876500026','hotel26@tntours.com','www.thanjavurroyal.com','https://book.com/h26',6500.00,'Pool,Spa,Gym,WiFi','hotel26.jpg',10.7828,79.1318),
(27,31,'Meghamalai Nature Resort','Resort',4.5,'Hill Road','Theni','9876500027','hotel27@tntours.com','www.meghamalairesort.com','https://book.com/h27',5400.00,'Nature View,WiFi','hotel27.jpg',9.6820,77.3950),
(28,33,'Tuticorin Harbour Hotel','Business',4.0,'Port Road','Thoothukudi','9876500028','hotel28@tntours.com','www.harbourhotel.com','https://book.com/h28',3900.00,'Restaurant,WiFi','hotel28.jpg',8.7642,78.1348),
(29,35,'Rockfort Residency','Business',4.0,'Rockfort Road','Tiruchirappalli','9876500029','hotel29@tntours.com','www.rockfortresidency.com','https://book.com/h29',4200.00,'WiFi,Gym','hotel29.jpg',10.8262,78.6928),
(30,37,'Nellai Grand Hotel','Luxury',4.5,'Temple Street','Tirunelveli','9876500030','hotel30@tntours.com','www.nellaigrand.com','https://book.com/h30',4700.00,'Pool,Restaurant','hotel30.jpg',8.7274,77.6845),
(31,38,'Yelagiri Hill View','Resort',4.0,'Lake Road','Tirupathur','9876500031','hotel31@tntours.com','www.yelagirihillview.com','https://book.com/h31',4100.00,'Hill View,WiFi','hotel31.jpg',12.5700,78.6400),
(32,39,'Avinashi Comfort Inn','Budget',3.5,'Temple Road','Tiruppur','9876500032','hotel32@tntours.com','www.avinashihotel.com','https://book.com/h32',2400.00,'WiFi,Parking','hotel32.jpg',11.1900,77.2700),
(33,40,'Pulicat Lake Resort','Resort',4.0,'Lake View Road','Tiruvallur','9876500033','hotel33@tntours.com','www.pulicatresort.com','https://book.com/h33',4600.00,'Lake View,Restaurant','hotel33.jpg',13.4200,80.3200),
(34,41,'Arunachala Residency','Business',4.5,'Temple Street','Tiruvannamalai','9876500034','hotel34@tntours.com','www.arunachalaresidency.com','https://book.com/h34',4400.00,'WiFi,Breakfast','hotel34.jpg',12.2253,79.0747),
(35,43,'Thiruvarur Palace','Business',4.0,'Main Road','Tiruvarur','9876500035','hotel35@tntours.com','www.thiruvarurpalace.com','https://book.com/h35',3600.00,'Restaurant,WiFi','hotel35.jpg',10.7720,79.6360),
(36,44,'Vellore Fort Inn','Luxury',4.5,'Fort Road','Vellore','9876500036','hotel36@tntours.com','www.vellorefortinn.com','https://book.com/h36',5200.00,'Pool,Gym','hotel36.jpg',12.9165,79.1325),
(37,46,'Gingee Heritage Hotel','Heritage',4.5,'Fort Road','Viluppuram','9876500037','hotel37@tntours.com','www.gingeeheritage.com','https://book.com/h37',5000.00,'Restaurant,WiFi','hotel37.jpg',12.2520,79.4170),
(38,48,'Andal Residency','Budget',3.5,'Temple Street','Virudhunagar','9876500038','hotel38@tntours.com','www.andalresidency.com','https://book.com/h38',2500.00,'WiFi','hotel38.jpg',9.5125,77.6340),
(3,50,'Chennai Business Hotel','Business',4.0,'OMR Road','Chennai','9876500039','hotel39@tntours.com','www.chennaibusiness.com','https://book.com/h39',4300.00,'WiFi,Gym','hotel39.jpg',13.0500,80.2500),
(14,14,'Temple View Residency','Budget',3.5,'West Tower Road','Madurai','9876500040','hotel40@tntours.com','www.templeview.com','https://book.com/h40',2900.00,'WiFi','hotel40.jpg',9.9195,78.1193),
(18,18,'Ooty Lake Resort','Luxury',5.0,'Lake Road','Ooty','9876500041','hotel41@tntours.com','www.ootylake.com','https://book.com/h41',7100.00,'Pool,Spa','hotel41.jpg',11.4102,76.6950),
(11,11,'Cape Sunrise Resort','Resort',4.5,'Beach Road','Kanyakumari','9876500042','hotel42@tntours.com','www.capesunrise.com','https://book.com/h42',5600.00,'Sea View,Pool','hotel42.jpg',8.0780,77.5540),
(23,25,'Salem City Hotel','Business',4.0,'Junction Road','Salem','9876500043','hotel43@tntours.com','www.salemcityhotel.com','https://book.com/h43',3700.00,'WiFi,Breakfast','hotel43.jpg',11.6643,78.1460),
(4,4,'Western Residency','Business',4.0,'Race Course','Coimbatore','9876500044','hotel44@tntours.com','www.westernresidency.com','https://book.com/h44',4500.00,'Gym,WiFi','hotel44.jpg',11.0168,76.9558),
(7,7,'Kodai Mountain View','Resort',4.5,'Coaker''s Walk','Kodaikanal','9876500045','hotel45@tntours.com','www.kodaimountain.com','https://book.com/h45',5900.00,'Mountain View','hotel45.jpg',10.2381,77.4892),
(10,10,'Silk Heritage Hotel','Heritage',4.5,'Temple Street','Kanchipuram','9876500046','hotel46@tntours.com','www.silkheritage.com','https://book.com/h46',4800.00,'Restaurant,WiFi','hotel46.jpg',12.8342,79.7036),
(16,16,'Pilgrim Residency','Budget',3.5,'Church Road','Velankanni','9876500047','hotel47@tntours.com','www.pilgrimstay.com','https://book.com/h47',2600.00,'WiFi','hotel47.jpg',10.6825,79.8528),
(21,22,'Rameswaram Heritage Inn','Heritage',4.0,'Temple Road','Rameswaram','9876500048','hotel48@tntours.com','www.rameswaramheritage.com','https://book.com/h48',4100.00,'Restaurant','hotel48.jpg',9.2881,79.3174),
(26,30,'Chola Palace Hotel','Luxury',5.0,'Palace Road','Thanjavur','9876500049','hotel49@tntours.com','www.cholapalace.com','https://book.com/h49',6900.00,'Pool,Spa,Gym','hotel49.jpg',10.7865,79.1388),
(29,36,'Srirangam Residency','Budget',3.5,'Temple Street','Tiruchirappalli','9876500050','hotel50@tntours.com','www.srirangamstay.com','https://book.com/h50',3100.00,'WiFi,Parking','hotel50.jpg',10.8625,78.6921);

INSERT INTO restaurants
(district_id,place_id, restaurant_name, cuisine_type, address, phone, email, website, opening_time, closing_time, average_cost, rating, image)
VALUES
(3,NULL, 'Marina Food Court', 'South Indian', 'Marina Beach, Chennai', '9876500001', 'info1@marinafood.com', 'www.marinafood.com', '07:00:00', '22:00:00', 350.00, 4.5, 'marina_food.jpg'),
(4, NULL, 'Kongu Delight', 'Kongu', 'Gandhipuram, Coimbatore', '9876500002', 'info2@kongudelight.com', 'www.kongudelight.com', '08:00:00', '22:00:00', 400.00, 4.4, 'kongu.jpg'),
(14,NULL, 'Meenakshi Mess', 'South Indian', 'Madurai', '9876500003', 'info3@meenakshimess.com', 'www.meenakshimess.com', '06:30:00', '22:00:00', 300.00, 4.6, 'meenakshi.jpg'),
(23,NULL, 'Yercaud Spice', 'Multi Cuisine', 'Salem', '9876500004', 'info4@yercaudspice.com', 'www.yercaudspice.com', '08:00:00', '22:00:00', 550.00, 4.3, 'yercaud.jpg'),
(29, NULL, 'Rockfort Restaurant', 'South Indian', 'Trichy', '9876500005', 'info5@rockfort.com', 'www.rockfort.com', '07:00:00', '22:30:00', 450.00, 4.4, 'rockfort.jpg'),
(30, NULL, 'Nellai Cafe', 'Tamil Cuisine', 'Tirunelveli', '9876500006', 'info6@nellai.com', 'www.nellaicafe.com', '07:00:00', '22:00:00', 320.00, 4.5, 'nellai.jpg'),
(36,NULL, 'Golden Temple Foods', 'Vegetarian', 'Vellore', '9876500007', 'info7@goldenfoods.com', 'www.goldenfoods.com', '08:00:00', '21:30:00', 420.00, 4.2, 'golden.jpg'),
(8,NULL, 'Bhavani Hotel', 'South Indian', 'Erode', '9876500008', 'info8@bhavani.com', 'www.bhavanihotel.com', '07:00:00', '22:00:00', 330.00, 4.1, 'bhavani.jpg'),
(10,NULL, 'Temple View Restaurant', 'Vegetarian', 'Kanchipuram', '9876500009', 'info9@templeview.com', 'www.templeview.com', '07:00:00', '22:00:00', 350.00, 4.4, 'temple.jpg'),
(28,NULL, 'Harbour Grill', 'Seafood', 'Thoothukudi', '9876500010', 'info10@harbour.com', 'www.harbourgrill.com', '10:00:00', '23:00:00', 650.00, 4.6, 'harbour.jpg'),
(7,NULL, 'Kodai Family Restaurant', 'Multi Cuisine', 'Dindigul', '9876500011', 'info11@kodai.com', 'www.kodai.com', '08:00:00', '22:00:00', 500.00, 4.3, 'kodai.jpg'),
(26,NULL, 'Temple City Foods', 'South Indian', 'Thanjavur', '9876500012', 'info12@templecity.com', 'www.templecity.com', '07:00:00', '22:00:00', 350.00, 4.5, 'thanjavur.jpg'),
(37,NULL, 'Villupuram Cafe', 'Fast Food', 'Villupuram', '9876500013', 'info13@villupuram.com', 'www.villupuram.com', '09:00:00', '22:00:00', 280.00, 4.0, 'villupuram.jpg'),
(5,NULL, 'Silver Beach Restaurant', 'Seafood', 'Cuddalore', '9876500014', 'info14@silverbeach.com', 'www.silverbeach.com', '10:00:00', '23:00:00', 700.00, 4.5, 'silver.jpg'),
(16,NULL, 'Velankanni Veg', 'Vegetarian', 'Nagapattinam', '9876500015', 'info15@velankanni.com', 'www.velankanni.com', '07:00:00', '22:00:00', 300.00, 4.4, 'velankanni.jpg'),
(11,NULL, 'Sunrise Restaurant', 'Multi Cuisine', 'Kanyakumari', '9876500016', 'info16@sunrise.com', 'www.sunrise.com', '07:00:00', '22:30:00', 600.00, 4.7, 'sunrise.jpg'),
(12,NULL, 'Karur Spice', 'South Indian', 'Karur', '9876500017', 'info17@karur.com', 'www.karur.com', '08:00:00', '22:00:00', 350.00, 4.2, 'karur.jpg'),
(17,NULL, 'Namakkal Mess', 'Tamil Cuisine', 'Namakkal', '9876500018', 'info18@namakkal.com', 'www.namakkal.com', '07:00:00', '22:00:00', 300.00, 4.3, 'namakkal.jpg'),
(13,NULL, 'Krishnagiri Foods', 'South Indian', 'Krishnagiri', '9876500019', 'info19@krishnagiri.com', 'www.krishnagiri.com', '07:30:00', '22:00:00', 340.00, 4.2, 'krishnagiri.jpg'),
(6,NULL, 'Hogenakkal View', 'Multi Cuisine', 'Dharmapuri', '9876500020', 'info20@hogenakkal.com', 'www.hogenakkal.com', '08:00:00', '22:00:00', 500.00, 4.5, 'hogenakkal.jpg'),
(21,NULL, 'Rameswaram Sea Foods', 'Seafood', 'Ramanathapuram', '9876500021', 'info21@rameswaram.com', 'www.rameswaram.com', '10:00:00', '22:30:00', 750.00, 4.8, 'rameswaram.jpg'),
(24,NULL, 'Sivagangai Cafe', 'South Indian', 'Sivagangai', '9876500022', 'info22@sivagangai.com', 'www.sivagangai.com', '07:00:00', '22:00:00', 320.00, 4.2, 'sivagangai.jpg'),
(23,NULL, 'Srivilliputhur Sweets', 'Snacks', 'Virudhunagar', '9876500023', 'info23@sweets.com', 'www.sweets.com', '08:00:00', '21:00:00', 250.00, 4.6, 'sweets.jpg'),
(1,NULL, 'Chola Restaurant', 'South Indian', 'Ariyalur', '9876500024', 'info24@chola.com', 'www.chola.com', '07:00:00', '22:00:00', 330.00, 4.3, 'chola.jpg'),
(19,NULL, 'Perambalur Food Point', 'Fast Food', 'Perambalur', '9876500025', 'info25@foodpoint.com', 'www.foodpoint.com', '09:00:00', '22:00:00', 280.00, 4.1, 'foodpoint.jpg'),
(20,NULL, 'Sithannavasal Inn', 'Multi Cuisine', 'Pudukkottai', '9876500026', 'info26@sithan.com', 'www.sithan.com', '08:00:00', '22:00:00', 450.00, 4.3, 'sithan.jpg'),
(25,NULL, 'Courtallam Restaurant', 'South Indian', 'Tenkasi', '9876500027', 'info27@courtallam.com', 'www.courtallam.com', '07:00:00', '22:00:00', 380.00, 4.5, 'courtallam.jpg'),
(18,NULL, 'Ooty Hills Restaurant', 'Multi Cuisine', 'Nilgiris', '9876500028', 'info28@ooty.com', 'www.ooty.com', '08:00:00', '22:00:00', 650.00, 4.7, 'ooty.jpg'),
(15,NULL, 'Mayiladuthurai Cafe', 'South Indian', 'Mayiladuthurai', '9876500029', 'info29@mayil.com', 'www.mayil.com', '07:00:00', '22:00:00', 320.00, 4.2, 'mayil.jpg'),
(35,NULL, 'Thiruvarur Delight', 'Vegetarian', 'Thiruvarur', '9876500030', 'info30@thiru.com', 'www.thiru.com', '07:00:00', '22:00:00', 350.00, 4.3, 'thiru.jpg'),
(22,NULL, 'Ranipet Family Restaurant', 'Multi Cuisine', 'Ranipet', '9876500031', 'info31@ranipet.com', 'www.ranipet.com', '08:00:00', '22:00:00', 450.00, 4.2, 'ranipet.jpg'),
(31,NULL, 'Yelagiri View', 'Multi Cuisine', 'Tirupattur', '9876500032', 'info32@yelagiri.com', 'www.yelagiri.com', '08:00:00', '22:00:00', 550.00, 4.4, 'yelagiri.jpg'),
(34,NULL, 'Annamalai Foods', 'Vegetarian', 'Tiruvannamalai', '9876500033', 'info33@annamalai.com', 'www.annamalai.com', '07:00:00', '22:00:00', 340.00, 4.5, 'annamalai.jpg'),
(9,NULL, 'Kallakurichi Hotel', 'South Indian', 'Kallakurichi', '9876500034', 'info34@kallakurichi.com', 'www.kallakurichi.com', '07:00:00', '22:00:00', 330.00, 4.2, 'kallakurichi.jpg'),
(2,NULL, 'Mahabalipuram Sea View', 'Seafood', 'Chengalpattu', '9876500035', 'info35@seaview.com', 'www.seaview.com', '10:00:00', '23:00:00', 800.00, 4.8, 'seaview.jpg'),
(33,NULL, 'Poondi Restaurant', 'South Indian', 'Tiruvallur', '9876500036', 'info36@poondi.com', 'www.poondi.com', '07:00:00', '22:00:00', 320.00, 4.1, 'poondi.jpg'),
(32,NULL, 'Tiruppur Cafe', 'Fast Food', 'Tiruppur', '9876500037', 'info37@tiruppur.com', 'www.tiruppur.com', '08:00:00', '22:00:00', 300.00, 4.2, 'tiruppur.jpg'),
(13,NULL, 'Hosur Garden Restaurant', 'Multi Cuisine', 'Hosur', '9876500038', 'info38@hosur.com', 'www.hosur.com', '08:00:00', '22:00:00', 480.00, 4.3, 'hosur.jpg'),
(3,NULL, 'Chennai Dosa House', 'South Indian', 'T Nagar, Chennai', '9876500039', 'info39@dosa.com', 'www.dosa.com', '06:30:00', '22:30:00', 250.00, 4.6, 'dosa.jpg'),
(4,NULL, 'Coimbatore Grill', 'Barbecue', 'RS Puram', '9876500040', 'info40@grill.com', 'www.grill.com', '11:00:00', '23:00:00', 850.00, 4.5, 'grill.jpg'),
(14,NULL, 'Madurai Biryani', 'Biryani', 'Madurai', '9876500041', 'info41@biryani.com', 'www.biryani.com', '11:00:00', '23:00:00', 450.00, 4.8, 'biryani.jpg'),
(23,NULL, 'Salem Veg Plaza', 'Vegetarian', 'Salem', '9876500042', 'info42@vegplaza.com', 'www.vegplaza.com', '07:00:00', '22:00:00', 320.00, 4.2, 'vegplaza.jpg'),
(29,NULL, 'Trichy Food Corner', 'Chinese', 'Trichy', '9876500043', 'info43@foodcorner.com', 'www.foodcorner.com', '10:00:00', '22:30:00', 500.00, 4.3, 'foodcorner.jpg'),
(30,NULL, 'Nellai Restaurant', 'South Indian', 'Tirunelveli', '9876500044', 'info44@nellairest.com', 'www.nellairest.com', '07:00:00', '22:00:00', 330.00, 4.4, 'nellairest.jpg'),
(7,NULL, 'Vellore Family Restaurant', 'North Indian', 'Vellore', '9876500045', 'info45@vellore.com', 'www.vellore.com', '08:00:00', '22:00:00', 600.00, 4.4, 'vellore.jpg'),
(8,NULL, 'Erode Spice', 'Chettinad', 'Erode', '9876500046', 'info46@erode.com', 'www.erode.com', '11:00:00', '23:00:00', 550.00, 4.5, 'erode.jpg'),
(10,NULL, 'Kanchi Veg Meals', 'Vegetarian', 'Kanchipuram', '9876500047', 'info47@kanchi.com', 'www.kanchi.com', '07:00:00', '21:30:00', 280.00, 4.3, 'kanchi.jpg'),
(28,NULL, 'Thoothukudi Seafood House', 'Seafood', 'Thoothukudi', '9876500048', 'info48@seafood.com', 'www.seafood.com', '10:00:00', '23:00:00', 780.00, 4.7, 'seafood.jpg'),
(7,NULL, 'Dindigul Thalappakatti', 'Biryani', 'Dindigul', '9876500049', 'info49@thalappakatti.com', 'www.thalappakatti.com', '11:00:00', '23:00:00', 600.00, 4.9, 'thalappakatti.jpg'),
(26,NULL, 'Thanjavur Heritage Restaurant', 'Traditional Tamil', 'Thanjavur', '9876500050', 'info50@heritage.com', 'www.heritage.com', '07:00:00', '22:00:00', 450.00, 4.6, 'heritage.jpg');

INSERT INTO transport
(district_id, transport_type, service_name, source, destination, contact_number, description, verified)
VALUES
(3, 'Bus', 'Chennai MTC', 'Chennai Central', 'Marina Beach', '04423456701', 'City bus service connecting Central to Marina Beach.', 1),
(4, 'Bus', 'Coimbatore City Bus', 'Gandhipuram', 'Ukkadam', '042223456702', 'Frequent city bus service.', 1),
(14, 'Train', 'Southern Railway', 'Madurai Junction', 'Chennai Egmore', '045223456703', 'Daily express train service.', 1),
(23, 'Taxi', 'Salem Taxi Service', 'Salem Bus Stand', 'Yercaud', '042723456704', 'Taxi service for hill station tourists.', 1),
(29, 'Bus', 'Tiruchirappalli Bus', 'Central Bus Stand', 'Srirangam', '043123456705', 'Local bus service.', 1),
(30, 'Train', 'Southern Railway', 'Tirunelveli Junction', 'Nagercoil', '046223456706', 'Passenger train service.', 1),
(36, 'Taxi', 'Vellore Cabs', 'Vellore City', 'Golden Temple', '041623456707', 'Tourist taxi service.', 1),
(8, 'Bus', 'Erode Town Bus', 'Erode Bus Stand', 'Bhavani', '042423456708', 'Town bus service.', 1),
(10, 'Auto', 'Kanchipuram Auto', 'Bus Stand', 'Kailasanathar Temple', '044223456709', 'Auto service.', 1),
(28, 'Bus', 'Thoothukudi Express', 'Bus Stand', 'Harbour', '046123456710', 'Harbour transport.', 1),
(7, 'Taxi', 'Dindigul Travels', 'Railway Station', 'Kodaikanal', '045123456711', 'Hill station taxi.', 1),
(26, 'Bus', 'Thanjavur Transport', 'Old Bus Stand', 'Big Temple', '043623456712', 'Tourist shuttle.', 1),
(37, 'Train', 'Southern Railway', 'Villupuram', 'Chennai', '0414623456713', 'Express train.', 1),
(5, 'Bus', 'Cuddalore City Bus', 'Bus Stand', 'Silver Beach', '0414223456714', 'Beach route.', 1),
(16, 'Taxi', 'Nagapattinam Cabs', 'Railway Station', 'Velankanni', '0436523456715', 'Pilgrim taxi.', 1),
(11, 'Bus', 'Kanyakumari Express', 'Bus Stand', 'Vivekananda Rock', '0465223456716', 'Tourist bus.', 1),
(12, 'Train', 'Southern Railway', 'Karur', 'Erode', '0432423456717', 'Passenger train.', 1),
(17, 'Bus', 'Namakkal Bus', 'Bus Stand', 'Anjaneyar Temple', '0428623456718', 'Temple bus.', 1),
(13, 'Taxi', 'Krishnagiri Cabs', 'Town', 'Hosur', '0434323456719', 'Intercity taxi.', 1),
(6, 'Bus', 'Dharmapuri Transport', 'Bus Stand', 'Hogenakkal', '0434223456720', 'Tourist bus.', 1),
(21, 'Bus', 'Ramanathapuram Bus', 'Town', 'Rameswaram', '0456723456721', 'Pilgrim bus.', 1),
(24, 'Train', 'Southern Railway', 'Sivagangai', 'Madurai', '0457523456722', 'Passenger train.', 1),
(38, 'Taxi', 'Virudhunagar Taxi', 'Town', 'Srivilliputhur', '0456223456723', 'Taxi service.', 1),
(24, 'Bus', 'Ariyalur Bus', 'Bus Stand', 'Gangaikonda Cholapuram', '0432923456724', 'Tourist route.', 1),
(19, 'Auto', 'Perambalur Auto', 'Bus Stand', 'City Center', '0432823456725', 'Auto service.', 0),
(20, 'Bus', 'Pudukkottai Bus', 'Bus Stand', 'Sithannavasal', '0432223456726', 'Tourist shuttle.', 1),
(25, 'Taxi', 'Tenkasi Taxi', 'Railway Station', 'Courtallam', '0463323456727', 'Waterfalls taxi.', 1),
(18, 'Bus', 'Nilgiris Transport', 'Ooty', 'Botanical Garden', '042323456728', 'Tourist bus.', 1),
(15, 'Train', 'Southern Railway', 'Mayiladuthurai', 'Chennai', '0436423456729', 'Express train.', 1),
(35, 'Bus', 'Tiruvarur Bus', 'Bus Stand', 'Thyagaraja Temple', '0436623456730', 'Temple service.', 1),
(22, 'Taxi', 'Ranipet Cabs', 'Town', 'Arcot', '0417223456731', 'Local taxi.', 0),
(31, 'Bus', 'Tirupattur Bus', 'Bus Stand', 'Yelagiri', '0417923456732', 'Hill route.', 1),
(34, 'Taxi', 'Tiruvannamalai Taxi', 'Bus Stand', 'Arunachaleswarar Temple', '0417523456733', 'Temple taxi.', 1),
(9, 'Bus', 'Kallakurichi Bus', 'Town', 'Bus Stand', '0415123456734', 'Town service.', 0),
(2, 'Bus', 'Chengalpattu Bus', 'Railway Station', 'Mahabalipuram', '04427456735', 'Tourist bus.', 1),
(33, 'Taxi', 'Tiruvallur Cabs', 'Town', 'Poondi Reservoir', '04427656736', 'Tourist taxi.', 1),
(32, 'Bus', 'Tiruppur City Bus', 'Bus Stand', 'Railway Station', '042123456737', 'City route.', 1),
(13, 'Taxi', 'Hosur Taxi', 'Bus Stand', 'Bengaluru Border', '0434423456738', 'Interstate taxi.', 1),

(1, 'Metro', 'Chennai Metro', 'Airport', 'Central', '04440000001', 'Metro rail service.', 1),
(4, 'Taxi', 'Coimbatore Airport Taxi', 'Airport', 'City Center', '042240000002', 'Airport taxi.', 1),
(14, 'Bus', 'Madurai City Bus', 'Periyar Bus Stand', 'Meenakshi Temple', '045240000003', 'Temple route.', 1),
(23, 'Train', 'Salem Passenger', 'Salem', 'Erode', '042740000004', 'Passenger train.', 1),
(29, 'Taxi', 'Trichy Airport Taxi', 'Airport', 'Rockfort Temple', '043140000005', 'Airport transfer.', 1),
(30, 'Bus', 'Tirunelveli Town Bus', 'Junction', 'Nellaiappar Temple', '046240000006', 'Temple bus.', 1),
(7, 'Bus', 'Vellore Local Bus', 'Bus Stand', 'CMC Hospital', '041640000007', 'Hospital route.', 1),
(8, 'Taxi', 'Erode Taxi Service', 'Railway Station', 'Bus Stand', '042440000008', 'City taxi.', 0),
(10, 'Bus', 'Kanchipuram Tourist Bus', 'Bus Stand', 'Ekambareswarar Temple', '044240000009', 'Tourist service.', 1),
(28, 'Taxi', 'Thoothukudi Harbour Taxi', 'Railway Station', 'Harbour', '046140000010', 'Harbour transfer.', 1);

INSERT INTO feedback
(user_id, place_id, rating, comments, feedback_date)
VALUES
(1,1,5,'Excellent heritage site with rich history.','2026-08-01 09:15:00'),
(2,2,5,'Beautiful architecture and clean surroundings.','2026-08-01 10:20:00'),
(3,3,4,'Wonderful beach but crowded during weekends.','2026-08-01 11:30:00'),
(4,4,5,'Temple is peaceful and well maintained.','2026-08-01 12:10:00'),
(5,5,4,'Nice beach with good atmosphere.','2026-08-01 13:00:00'),
(6,6,5,'Amazing waterfalls and natural beauty.','2026-08-01 13:45:00'),
(7,7,5,'Kodaikanal is a must visit destination.','2026-08-01 14:30:00'),
(8,8,4,'Temple is clean and spiritually uplifting.','2026-08-01 15:20:00'),
(9,9,4,'Hill station offers beautiful scenery.','2026-08-01 16:10:00'),
(10,10,5,'Historic temple with stunning architecture.','2026-08-01 17:00:00'),
(11,11,5,'Sunrise view is unforgettable.','2026-08-01 17:40:00'),
(12,12,4,'Very peaceful temple.','2026-08-01 18:15:00'),
(13,13,4,'Dam is clean and scenic.','2026-08-01 19:00:00'),
(14,14,5,'Meenakshi Temple is magnificent.','2026-08-01 19:40:00'),
(15,15,4,'Ancient temple with beautiful carvings.','2026-08-01 20:10:00'),
(16,16,5,'Wonderful pilgrimage destination.','2026-08-01 20:50:00'),
(17,17,4,'Fort has excellent panoramic views.','2026-08-02 08:00:00'),
(18,18,5,'Botanical garden is very beautiful.','2026-08-02 08:40:00'),
(19,19,4,'Historic fort worth visiting.','2026-08-02 09:20:00'),
(20,20,5,'Ancient cave paintings are impressive.','2026-08-02 10:00:00'),
(21,21,5,'Bridge engineering is amazing.','2026-08-02 10:45:00'),
(22,22,5,'Temple visit was memorable.','2026-08-02 11:30:00'),
(23,23,4,'Fort is maintained well.','2026-08-02 12:00:00'),
(24,24,5,'Yercaud weather was pleasant.','2026-08-02 12:45:00'),
(25,25,4,'View point is fantastic.','2026-08-02 13:20:00'),
(26,26,5,'Chettinad heritage is unique.','2026-08-02 14:00:00'),
(27,27,5,'Courtallam waterfalls are refreshing.','2026-08-02 14:40:00'),
(28,28,4,'Old falls are peaceful.','2026-08-02 15:15:00'),
(29,29,5,'Big Temple is world class.','2026-08-02 16:00:00'),
(30,30,4,'Palace museum is informative.','2026-08-02 16:40:00'),
(31,31,5,'Meghamalai is breathtaking.','2026-08-02 17:15:00'),
(32,32,4,'Suruli Falls are beautiful.','2026-08-02 17:50:00'),
(33,33,4,'Port visit was interesting.','2026-08-02 18:20:00'),
(34,34,5,'Church architecture is beautiful.','2026-08-02 18:55:00'),
(35,35,5,'Rockfort gives an excellent city view.','2026-08-03 08:00:00'),
(36,36,5,'Srirangam temple is very grand.','2026-08-03 08:45:00'),
(37,37,5,'Temple atmosphere is divine.','2026-08-03 09:15:00'),
(38,38,4,'Yelagiri is peaceful and relaxing.','2026-08-03 09:50:00'),
(39,39,4,'Ancient temple is well preserved.','2026-08-03 10:20:00'),
(40,40,5,'Pulicat Lake is perfect for bird watching.','2026-08-03 11:00:00'),
(41,41,5,'Arunachaleswarar Temple is magnificent.','2026-08-03 11:40:00'),
(42,42,5,'Ashram offers complete peace.','2026-08-03 12:15:00'),
(43,43,4,'Temple architecture is beautiful.','2026-08-03 13:00:00'),
(44,44,5,'Vellore Fort is well maintained.','2026-08-03 13:45:00'),
(45,45,5,'Golden Temple is breathtaking.','2026-08-03 14:20:00'),
(46,46,5,'Gingee Fort is a must visit.','2026-08-03 15:00:00'),
(47,47,5,'Mangrove boating was enjoyable.','2026-08-03 15:40:00'),
(48,48,5,'Temple is very clean and beautiful.','2026-08-03 16:15:00'),
(49,49,4,'Waterfall is worth visiting.','2026-08-03 17:00:00'),
(50,50,5,'National park is clean and peaceful.','2026-08-03 17:45:00');

INSERT INTO favorites
(user_id, place_id, created_at)
VALUES
(1,14,'2026-08-01 09:00:00'),
(2,2,'2026-08-01 09:15:00'),
(3,3,'2026-08-01 09:30:00'),
(4,4,'2026-08-01 09:45:00'),
(5,5,'2026-08-01 10:00:00'),
(6,6,'2026-08-01 10:15:00'),
(7,7,'2026-08-01 10:30:00'),
(8,8,'2026-08-01 10:45:00'),
(9,9,'2026-08-01 11:00:00'),
(10,10,'2026-08-01 11:15:00'),
(11,11,'2026-08-01 11:30:00'),
(12,12,'2026-08-01 11:45:00'),
(13,13,'2026-08-01 12:00:00'),
(14,14,'2026-08-01 12:15:00'),
(15,15,'2026-08-01 12:30:00'),
(16,16,'2026-08-01 12:45:00'),
(17,17,'2026-08-01 13:00:00'),
(18,18,'2026-08-01 13:15:00'),
(19,19,'2026-08-01 13:30:00'),
(20,20,'2026-08-01 13:45:00'),
(21,21,'2026-08-01 14:00:00'),
(22,22,'2026-08-01 14:15:00'),
(23,23,'2026-08-01 14:30:00'),
(24,24,'2026-08-01 14:45:00'),
(25,25,'2026-08-01 15:00:00'),
(26,26,'2026-08-01 15:15:00'),
(27,27,'2026-08-01 15:30:00'),
(28,28,'2026-08-01 15:45:00'),
(29,29,'2026-08-01 16:00:00'),
(30,30,'2026-08-01 16:15:00'),
(31,31,'2026-08-01 16:30:00'),
(32,32,'2026-08-01 16:45:00'),
(33,33,'2026-08-01 17:00:00'),
(34,34,'2026-08-01 17:15:00'),
(35,35,'2026-08-01 17:30:00'),
(36,36,'2026-08-01 17:45:00'),
(37,37,'2026-08-01 18:00:00'),
(38,38,'2026-08-01 18:15:00'),
(39,39,'2026-08-01 18:30:00'),
(40,40,'2026-08-01 18:45:00'),
(41,41,'2026-08-01 19:00:00'),
(42,42,'2026-08-01 19:15:00'),
(43,43,'2026-08-01 19:30:00'),
(44,44,'2026-08-01 19:45:00'),
(45,45,'2026-08-01 20:00:00'),
(46,46,'2026-08-01 20:15:00'),
(47,47,'2026-08-01 20:30:00'),
(48,48,'2026-08-01 20:45:00'),
(49,49,'2026-08-01 21:00:00'),
(50,50,'2026-08-01 21:15:00');

INSERT INTO search_history
(user_id, search_keyword, search_type, search_date)
VALUES
(1,'Meenakshi Amman Temple','Temple','2026-08-01 08:00:00'),
(2,'Marina Beach','Beach','2026-08-01 08:10:00'),
(3,'Ooty','Hill Station','2026-08-01 08:20:00'),
(4,'Kodaikanal','Hill Station','2026-08-01 08:30:00'),
(5,'Mahabalipuram','Heritage','2026-08-01 08:40:00'),
(6,'Hogenakkal Falls','Waterfall','2026-08-01 08:50:00'),
(7,'Courtallam Falls','Waterfall','2026-08-01 09:00:00'),
(8,'Yercaud','Hill Station','2026-08-01 09:10:00'),
(9,'Rameswaram','Temple','2026-08-01 09:20:00'),
(10,'Vivekananda Rock Memorial','Monument','2026-08-01 09:30:00'),
(11,'Brihadeeswarar Temple','Temple','2026-08-01 09:40:00'),
(12,'Thanjavur Palace','Heritage','2026-08-01 09:50:00'),
(13,'Srirangam Temple','Temple','2026-08-01 10:00:00'),
(14,'Rockfort Temple','Temple','2026-08-01 10:10:00'),
(15,'Velankanni Church','Church','2026-08-01 10:20:00'),
(16,'Pichavaram Mangrove','Nature','2026-08-01 10:30:00'),
(17,'Pulicat Lake','Lake','2026-08-01 10:40:00'),
(18,'Gingee Fort','Fort','2026-08-01 10:50:00'),
(19,'Vellore Fort','Fort','2026-08-01 11:00:00'),
(20,'Golden Temple Vellore','Temple','2026-08-01 11:10:00'),
(21,'Nilgiri Mountain Railway','Train','2026-08-01 11:20:00'),
(22,'Botanical Garden Ooty','Garden','2026-08-01 11:30:00'),
(23,'Chettinad Palace','Heritage','2026-08-01 11:40:00'),
(24,'Meghamalai','Hill Station','2026-08-01 11:50:00'),
(25,'Suruli Falls','Waterfall','2026-08-01 12:00:00'),
(26,'Kanyakumari Sunrise','Beach','2026-08-01 12:10:00'),
(27,'Pamban Bridge','Bridge','2026-08-01 12:20:00'),
(28,'Arunachaleswarar Temple','Temple','2026-08-01 12:30:00'),
(29,'Ramana Ashram','Spiritual','2026-08-01 12:40:00'),
(30,'Yelagiri Hills','Hill Station','2026-08-01 12:50:00'),
(31,'Ekambareswarar Temple','Temple','2026-08-01 13:00:00'),
(32,'Kailasanathar Temple','Temple','2026-08-01 13:10:00'),
(33,'Silver Beach','Beach','2026-08-01 13:20:00'),
(34,'Bhavani Temple','Temple','2026-08-01 13:30:00'),
(35,'Krishnagiri Dam','Dam','2026-08-01 13:40:00'),
(36,'Namakkal Fort','Fort','2026-08-01 13:50:00'),
(37,'Sittannavasal Cave','Heritage','2026-08-01 14:00:00'),
(38,'Mayuranathaswamy Temple','Temple','2026-08-01 14:10:00'),
(39,'Tuticorin Port','Port','2026-08-01 14:20:00'),
(40,'Courtallam','Waterfall','2026-08-01 14:30:00'),
(41,'Mahabalipuram Shore Temple','UNESCO','2026-08-01 14:40:00'),
(42,'Marudamalai Temple','Temple','2026-08-01 14:50:00'),
(43,'Toda Embroidery','Handicraft','2026-08-01 15:00:00'),
(44,'Thanjavur Painting','Handicraft','2026-08-01 15:10:00'),
(45,'Kanchipuram Silk Saree','Shopping','2026-08-01 15:20:00'),
(46,'Madurai Food','Restaurant','2026-08-01 15:30:00'),
(47,'Ooty Hotels','Hotel','2026-08-01 15:40:00'),
(48,'Kodaikanal Resorts','Hotel','2026-08-01 15:50:00'),
(49,'Chennai Restaurants','Restaurant','2026-08-01 16:00:00'),
(50,'Tamil Nadu Tourist Places','General','2026-08-01 16:10:00');

INSERT INTO ai_recommendations
(district_id, recommendation_title, recommendation, travel_type, best_time_to_visit, estimated_budget)
VALUES
(3,'Chennai Heritage Tour','Visit Marina Beach, Kapaleeshwarar Temple and Fort St. George.','Family','November-February','₹5,000'),
(4,'Coimbatore Nature Tour','Explore Marudhamalai Temple, Siruvani Dam and VOC Park.','Friends','October-February','₹4,500'),
(14,'Madurai Temple Tour','Visit Meenakshi Temple and Thirumalai Nayakkar Palace.','Couple','November-February','₹6,000'),
(23,'Yercaud Hill Trip','Enjoy Yercaud Lake and Pagoda Point.','Family','October-January','₹5,500'),
(29,'Trichy Heritage Tour','Visit Rock Fort and Srirangam Temple.','Family','November-February','₹4,000'),
(30,'Tirunelveli Temple Tour','Visit Nellaiappar Temple and Manimuthar Falls.','Family','October-February','₹4,500'),
(7,'Vellore Spiritual Tour','Visit Golden Temple and Vellore Fort.','Couple','November-February','₹5,000'),
(8,'Erode Weekend Tour','Explore Bhavani Temple and Kodiveri Dam.','Friends','September-February','₹3,500'),
(10,'Kanchipuram Temple Tour','Visit Ekambareswarar and Kailasanathar Temples.','Family','October-February','₹4,000'),
(28,'Thoothukudi Coastal Tour','Visit Harbour and Snows Basilica.','Family','November-February','₹4,500'),
(7,'Kodaikanal Hill Tour','Visit Kodaikanal Lake and Pillar Rocks.','Couple','April-June','₹8,000'),
(26,'Thanjavur Heritage Tour','Visit Brihadeeswarar Temple and Palace.','Family','November-February','₹4,500'),
(37,'Villupuram Fort Tour','Visit Gingee Fort and Mailam Temple.','Friends','October-February','₹4,000'),
(5,'Cuddalore Beach Tour','Visit Silver Beach and Fort St. David.','Family','November-February','₹4,500'),
(16,'Nagapattinam Pilgrimage','Visit Velankanni Basilica and Nagore Dargah.','Family','October-February','₹5,000'),
(11,'Kanyakumari Sunrise Tour','Visit Vivekananda Rock and Thiruvalluvar Statue.','Couple','October-March','₹6,000'),
(12,'Karur Temple Tour','Visit Pasupatheeswarar Temple and Amaravathi Dam.','Family','November-February','₹3,500'),
(17,'Namakkal Spiritual Tour','Visit Namakkal Fort and Anjaneyar Temple.','Family','October-February','₹3,000'),
(13,'Krishnagiri Adventure Tour','Visit Krishnagiri Dam and Rayakottai Fort.','Friends','September-February','₹4,500'),
(6,'Hogenakkal Falls Tour','Enjoy Hogenakkal Falls and Theerthamalai Temple.','Friends','October-February','₹5,000'),
(21,'Rameswaram Pilgrimage','Visit Ramanathaswamy Temple and Pamban Bridge.','Family','November-February','₹6,500'),
(24,'Chettinad Heritage Tour','Visit Chettinad Mansions and Pillayarpatti Temple.','Family','October-February','₹5,000'),
(38,'Srivilliputhur Tour','Visit Andal Temple and Ayyanar Falls.','Family','October-February','₹4,500'),
(1,'Ariyalur Heritage Tour','Visit Gangaikonda Cholapuram Temple.','Family','November-February','₹4,000'),
(19,'Perambalur Tour','Visit Ranjankudi Fort and nearby parks.','Friends','October-February','₹3,500'),
(20,'Pudukkottai Heritage Tour','Visit Sithannavasal and Thirumayam Fort.','Family','November-February','₹4,500'),
(25,'Tenkasi Waterfalls Tour','Visit Courtallam Falls and Kasi Viswanathar Temple.','Friends','June-September','₹5,000'),
(18,'Ooty Hill Station Tour','Visit Botanical Garden and Ooty Lake.','Couple','April-June','₹8,500'),
(15,'Mayiladuthurai Temple Tour','Visit Mayuranathar Temple.','Family','October-February','₹3,500'),
(35,'Thiruvarur Temple Tour','Visit Thyagaraja Temple.','Family','October-February','₹3,500'),
(22,'Ranipet Local Tour','Explore nearby historical attractions.','Friends','November-February','₹3,000'),
(31,'Yelagiri Hill Tour','Enjoy boating and trekking.','Couple','September-February','₹5,500'),
(34,'Tiruvannamalai Spiritual Tour','Visit Arunachaleswarar Temple.','Family','November-February','₹4,500'),
(9,'Kallakurichi Nature Tour','Visit Gomukhi Dam.','Friends','October-February','₹3,500'),
(2,'Mahabalipuram Tour','Visit Shore Temple and Five Rathas.','Family','November-February','₹6,000'),
(33,'Tiruvallur Temple Tour','Visit Veeraraghava Temple.','Family','October-February','₹3,500'),
(32,'Tiruppur Shopping Tour','Explore textile markets and local temples.','Friends','October-February','₹4,000'),
(13,'Hosur Weekend Tour','Visit Chandira Choodeswarar Temple.','Family','October-February','₹4,500'),

(3,'Chennai Food Tour','Enjoy beaches and famous restaurants.','Friends','November-February','₹5,500'),
(4,'Coimbatore Adventure','Nature trails and waterfalls.','Friends','September-January','₹5,000'),
(14,'Madurai Night Tour','Experience temple lights and local food.','Couple','November-February','₹5,500'),
(23,'Salem Hills Tour','Visit Yercaud and coffee plantations.','Family','October-January','₹6,000'),
(29,'Trichy Pilgrimage','Temple visits with river sightseeing.','Family','November-February','₹4,500'),
(30,'Tirunelveli Heritage','Temple and waterfall exploration.','Family','October-February','₹5,000'),
(36,'Vellore Weekend','Fort, museum and Golden Temple.','Couple','November-February','₹5,500'),
(8,'Erode Nature Escape','Dam, temples and river view.','Friends','October-February','₹4,000'),
(10,'Kanchipuram Silk Tour','Temple visit and silk shopping.','Family','October-February','₹5,000'),
(28,'Thoothukudi Beach Tour','Harbour, beach and seafood experience.','Friends','November-February','₹5,500');

INSERT INTO galleries
(district_id, place_id, image_title, image_path, description)
VALUES
(3, NULL, 'Marina Beach', 'images/chennai.jpg', 'Beautiful sunrise view of Marina Beach.'),
(3, NULL, 'Kapaleeshwarar Temple', 'images/chennai.jpg', 'Historic temple in Chennai.'),

(4, NULL, 'Marudhamalai Temple', 'images/coimbatore.jpg', 'Famous hill temple in Coimbatore.'),
(4, NULL, 'VOC Park', 'images/coimbatore.jpg', 'Popular park in Coimbatore.'),

(14, NULL, 'Meenakshi Amman Temple', 'images/madurai.jpg', 'World-famous temple in Madurai.'),
(14, NULL, 'Thirumalai Nayakkar Palace', 'images/madurai.jpg', 'Historic palace in Madurai.'),

(23, NULL, 'Yercaud Lake', 'images/salem.jpg', 'Scenic lake in Salem district.'),
(23, NULL, 'Pagoda Point', 'images/salem.jpg', 'Popular viewpoint in Yercaud.'),

(29, NULL, 'Rock Fort Temple', 'images/tiruchirappalli.jpg', 'Historic temple in Tiruchirappalli.'),
(29, NULL, 'Srirangam Temple', 'images/tiruchirappalli.jpg', 'Largest functioning Hindu temple.'),

(30, NULL, 'Nellaiappar Temple', 'images/tirunelveli.jpg', 'Ancient temple in Tirunelveli.'),
(30, NULL, 'Manimuthar Falls', 'images/tirunelveli.jpg', 'Beautiful waterfall.'),

(36, NULL, 'Vellore Fort', 'images/vellore.jpg', 'Historic granite fort.'),
(36, NULL, 'Golden Temple', 'images/vellore.jpg', 'Sripuram Golden Temple.'),

(8, NULL, 'Kodiveri Dam', 'images/erode.jpg', 'Popular tourist attraction.'),
(8, NULL, 'Bhavani Temple', 'images/erode.jpg', 'Temple at river confluence.'),

(10, NULL, 'Kailasanathar Temple', 'images/kanchipuram.jpg', 'Ancient Pallava temple.'),
(10, NULL, 'Ekambareswarar Temple', 'images/kanchipuram.jpg', 'Famous Shiva temple.'),

(28, NULL, 'Thoothukudi Harbour', 'images/thoothukudi.jpg', 'Major seaport of Tamil Nadu.'),
(28, NULL, 'Our Lady of Snows Basilica', 'images/thoothukudi.jpg', 'Historic church in Thoothukudi.'),

(7, NULL, 'Kodaikanal Lake', 'images/dindigul.jpg', 'Beautiful lake in Kodaikanal.'),
(7, NULL, 'Pillar Rocks', 'images/dindigul.jpg', 'Scenic viewpoint in Kodaikanal.'),

(26, NULL, 'Brihadeeswarar Temple', 'images/thanjavur.jpg', 'UNESCO World Heritage temple.'),
(26, NULL, 'Thanjavur Palace', 'images/thanjavur.jpg', 'Historic palace complex.'),

(37, NULL, 'Gingee Fort', 'images/viluppuram.jpg', 'Historic hill fort.'),
(37, NULL, 'Mailam Temple', 'images/viluppuram.jpg', 'Popular Murugan temple.'),

(5, NULL, 'Silver Beach', 'images/cuddalore.jpg', 'Longest beach in Tamil Nadu.'),
(5, NULL, 'Fort St. David', 'images/cuddalore.jpg', 'Historic British fort.'),

(16, NULL, 'Velankanni Basilica', 'images/nagapattinam.jpg', 'Famous Christian pilgrimage site.'),
(16, NULL, 'Nagore Dargah', 'images/nagapattinam.jpg', 'Renowned Islamic shrine.'),

(11, NULL, 'Vivekananda Rock Memorial', 'images/kanyakumari.jpg', 'Iconic memorial at Kanyakumari.'),
(11, NULL, 'Thiruvalluvar Statue', 'images/kanyakumari.jpg', '133-foot stone statue.'),

(12, NULL, 'Pasupatheeswarar Temple', 'images/karur.jpg', 'Ancient temple in Karur.'),
(12, NULL, 'Amaravathi Dam', 'images/karur.jpg', 'Beautiful dam and reservoir.'),

(17, NULL, 'Namakkal Fort', 'images/namakkal.jpg', 'Historic hill fort.'),
(17, NULL, 'Anjaneyar Temple', 'images/namakkal.jpg', 'Famous Hanuman temple.'),

(13, NULL, 'Krishnagiri Dam', 'images/krishnagiri.jpg', 'Popular tourist attraction.'),
(13, NULL, 'Rayakottai Fort', 'images/krishnagiri.jpg', 'Historic fort on a hill.'),

(6, NULL, 'Hogenakkal Falls', 'images/dharmapuri.jpg', 'Niagara of India.'),
(6, NULL, 'Theerthamalai Temple', 'images/dharmapuri.jpg', 'Ancient hill temple.'),

(21, NULL, 'Ramanathaswamy Temple', 'images/ramanathapuram.jpg', 'Sacred Jyotirlinga temple.'),
(21, NULL, 'Pamban Bridge', 'images/ramanathapuram.jpg', 'India''s famous sea bridge.'),

(24, NULL, 'Chettinad Palace', 'images/sivaganga.jpg', 'Traditional Chettinad mansion.'),
(24, NULL, 'Pillayarpatti Temple', 'images/sivaganga.jpg', 'Ancient cave temple.'),

(38, NULL, 'Srivilliputhur Temple', 'images/virudhunagar.jpg', 'Temple featured in Tamil Nadu emblem.'),
(38, NULL, 'Ayyanar Falls', 'images/virudhunagar.jpg', 'Scenic waterfall near Rajapalayam.'),

(1, NULL, 'Gangaikonda Cholapuram', 'images/ariyalur.jpg', 'UNESCO World Heritage temple.'),
(1, NULL, 'Karaivetti Bird Sanctuary', 'images/ariyalur.jpg', 'Bird sanctuary in Ariyalur.'),

(19, NULL, 'Ranjankudi Fort', 'images/perambalur.jpg', 'Historic fort in Perambalur.'),
(19, NULL, 'Sathanur Dam Park', 'images/perambalur.jpg', 'Popular family picnic destination.');

INSERT INTO bookings
(user_id, hotel_id, check_in, check_out, guests, total_amount, booking_status, booked_at)
VALUES
(1,1,'2026-09-01','2026-09-03',2,5000.00,'Confirmed','2026-08-01 09:00:00'),
(2,2,'2026-09-02','2026-09-04',3,7200.00,'Confirmed','2026-08-01 09:10:00'),
(3,3,'2026-09-03','2026-09-05',2,6400.00,'Pending','2026-08-01 09:20:00'),
(4,4,'2026-09-04','2026-09-06',4,9600.00,'Confirmed','2026-08-01 09:30:00'),
(5,5,'2026-09-05','2026-09-07',2,5800.00,'Completed','2026-08-01 09:40:00'),
(6,6,'2026-09-06','2026-09-08',2,6200.00,'Confirmed','2026-08-01 09:50:00'),
(7,7,'2026-09-07','2026-09-09',3,8400.00,'Pending','2026-08-01 10:00:00'),
(8,8,'2026-09-08','2026-09-10',2,4800.00,'Confirmed','2026-08-01 10:10:00'),
(9,9,'2026-09-09','2026-09-11',4,11000.00,'Completed','2026-08-01 10:20:00'),
(10,10,'2026-09-10','2026-09-12',2,6900.00,'Confirmed','2026-08-01 10:30:00'),
(11,11,'2026-09-11','2026-09-13',2,5300.00,'Confirmed','2026-08-01 10:40:00'),
(12,12,'2026-09-12','2026-09-14',3,8700.00,'Pending','2026-08-01 10:50:00'),
(13,13,'2026-09-13','2026-09-15',2,6100.00,'Completed','2026-08-01 11:00:00'),
(14,14,'2026-09-14','2026-09-16',5,14000.00,'Confirmed','2026-08-01 11:10:00'),
(15,15,'2026-09-15','2026-09-17',2,5500.00,'Cancelled','2026-08-01 11:20:00'),
(16,16,'2026-09-16','2026-09-18',2,6000.00,'Confirmed','2026-08-01 11:30:00'),
(17,17,'2026-09-17','2026-09-19',3,7800.00,'Pending','2026-08-01 11:40:00'),
(18,18,'2026-09-18','2026-09-20',2,9200.00,'Confirmed','2026-08-01 11:50:00'),
(19,19,'2026-09-19','2026-09-21',2,5000.00,'Completed','2026-08-01 12:00:00'),
(20,20,'2026-09-20','2026-09-22',4,12500.00,'Confirmed','2026-08-01 12:10:00'),
(21,21,'2026-09-21','2026-09-23',2,6400.00,'Confirmed','2026-08-01 12:20:00'),
(22,22,'2026-09-22','2026-09-24',2,6100.00,'Completed','2026-08-01 12:30:00'),
(23,23,'2026-09-23','2026-09-25',3,8900.00,'Pending','2026-08-01 12:40:00'),
(24,24,'2026-09-24','2026-09-26',2,7000.00,'Confirmed','2026-08-01 12:50:00'),
(25,25,'2026-09-25','2026-09-27',2,5800.00,'Completed','2026-08-01 13:00:00'),
(26,26,'2026-09-26','2026-09-28',3,9500.00,'Confirmed','2026-08-01 13:10:00'),
(27,27,'2026-09-27','2026-09-29',2,6300.00,'Pending','2026-08-01 13:20:00'),
(28,28,'2026-09-28','2026-09-30',4,11800.00,'Confirmed','2026-08-01 13:30:00'),
(29,29,'2026-09-29','2026-10-01',2,6900.00,'Completed','2026-08-01 13:40:00'),
(30,30,'2026-09-30','2026-10-02',2,6700.00,'Confirmed','2026-08-01 13:50:00'),
(31,31,'2026-10-01','2026-10-03',3,8100.00,'Confirmed','2026-08-01 14:00:00'),
(32,32,'2026-10-02','2026-10-04',2,5600.00,'Pending','2026-08-01 14:10:00'),
(33,33,'2026-10-03','2026-10-05',4,12000.00,'Completed','2026-08-01 14:20:00'),
(34,34,'2026-10-04','2026-10-06',2,6400.00,'Confirmed','2026-08-01 14:30:00'),
(35,35,'2026-10-05','2026-10-07',2,6000.00,'Confirmed','2026-08-01 14:40:00'),
(36,36,'2026-10-06','2026-10-08',3,8700.00,'Pending','2026-08-01 14:50:00'),
(37,37,'2026-10-07','2026-10-09',2,7200.00,'Completed','2026-08-01 15:00:00'),
(38,38,'2026-10-08','2026-10-10',2,5400.00,'Confirmed','2026-08-01 15:10:00'),
(39,39,'2026-10-09','2026-10-11',4,13200.00,'Confirmed','2026-08-01 15:20:00'),
(40,40,'2026-10-10','2026-10-12',2,6100.00,'Cancelled','2026-08-01 15:30:00'),
(41,41,'2026-10-11','2026-10-13',2,9800.00,'Confirmed','2026-08-01 15:40:00'),
(42,42,'2026-10-12','2026-10-14',3,8600.00,'Completed','2026-08-01 15:50:00'),
(43,43,'2026-10-13','2026-10-15',2,6500.00,'Pending','2026-08-01 16:00:00'),
(44,44,'2026-10-14','2026-10-16',2,6700.00,'Confirmed','2026-08-01 16:10:00'),
(45,45,'2026-10-15','2026-10-17',4,12400.00,'Confirmed','2026-08-01 16:20:00'),
(46,46,'2026-10-16','2026-10-18',2,6900.00,'Completed','2026-08-01 16:30:00'),
(47,47,'2026-10-17','2026-10-19',2,7200.00,'Confirmed','2026-08-01 16:40:00'),
(48,48,'2026-10-18','2026-10-20',3,9300.00,'Pending','2026-08-01 16:50:00'),
(49,49,'2026-10-19','2026-10-21',2,7600.00,'Confirmed','2026-08-01 17:00:00'),
(50,50,'2026-10-20','2026-10-22',2,8100.00,'Completed','2026-08-01 17:10:00');

INSERT INTO admin_logs
(admin_id, action, action_date)
VALUES
(1,'Logged into admin dashboard','2026-08-01 08:00:00'),
(1,'Added new tourist place: Ariyalur Temple','2026-08-01 08:15:00'),
(2,'Updated district information: Chennai','2026-08-01 08:30:00'),
(2,'Added new hotel: Chennai Grand Hotel','2026-08-01 08:45:00'),
(3,'Updated restaurant details','2026-08-01 09:00:00'),
(1,'Approved user feedback #5','2026-08-01 09:15:00'),
(2,'Deleted duplicate tourist place','2026-08-01 09:30:00'),
(3,'Added heritage site information','2026-08-01 09:45:00'),
(1,'Updated hotel prices','2026-08-01 10:00:00'),
(2,'Added transport schedule','2026-08-01 10:15:00'),
(3,'Updated weather cache','2026-08-01 10:30:00'),
(1,'Added new gallery images','2026-08-01 10:45:00'),
(2,'Reviewed booking request','2026-08-01 11:00:00'),
(3,'Updated AI recommendations','2026-08-01 11:15:00'),
(1,'Approved tourist feedback','2026-08-01 11:30:00'),
(2,'Updated handicraft details','2026-08-01 11:45:00'),
(3,'Added new restaurant','2026-08-01 12:00:00'),
(1,'Modified transport fare','2026-08-01 12:15:00'),
(2,'Removed invalid gallery image','2026-08-01 12:30:00'),
(3,'Updated district headquarters','2026-08-01 12:45:00'),
(1,'Added booking record','2026-08-01 13:00:00'),
(2,'Exported monthly report','2026-08-01 13:15:00'),
(3,'Imported tourist data','2026-08-01 13:30:00'),
(1,'Updated hotel availability','2026-08-01 13:45:00'),
(2,'Approved new user account','2026-08-01 14:00:00'),
(3,'Updated QR code information','2026-08-01 14:15:00'),
(1,'Changed homepage banner','2026-08-01 14:30:00'),
(2,'Added event information','2026-08-01 14:45:00'),
(3,'Updated contact details','2026-08-01 15:00:00'),
(1,'Deleted old weather records','2026-08-01 15:15:00'),
(2,'Updated gallery captions','2026-08-01 15:30:00'),
(3,'Approved hotel listing','2026-08-01 15:45:00'),
(1,'Updated restaurant ratings','2026-08-01 16:00:00'),
(2,'Generated analytics report','2026-08-01 16:15:00'),
(3,'Added tourism promotion banner','2026-08-01 16:30:00'),
(1,'Updated user account status','2026-08-01 16:45:00'),
(2,'Reviewed search history logs','2026-08-01 17:00:00'),
(3,'Added new district image','2026-08-01 17:15:00'),
(1,'Updated heritage information','2026-08-01 17:30:00'),
(2,'Modified hotel contact details','2026-08-01 17:45:00'),
(3,'Approved booking cancellation','2026-08-01 18:00:00'),
(1,'Updated tourism statistics','2026-08-01 18:15:00'),
(2,'Deleted inactive user account','2026-08-01 18:30:00'),
(3,'Updated homepage content','2026-08-01 18:45:00'),
(1,'Added new transport service','2026-08-01 19:00:00'),
(2,'Updated event calendar','2026-08-01 19:15:00'),
(3,'Reviewed user complaints','2026-08-01 19:30:00'),
(1,'Database backup completed','2026-08-01 19:45:00'),
(2,'System maintenance completed','2026-08-01 20:00:00'),
(3,'Logged out from admin panel','2026-08-01 20:15:00');

INSERT INTO events
(district_id, place_id, event_name, event_type, description, event_date, start_time, end_time, venue, ticket_price, image)
VALUES
(1, NULL, 'Ariyalur Heritage Festival', 'Cultural Festival', 'Traditional cultural festival showcasing the heritage of Ariyalur.', '2026-01-15', '09:00:00', '18:00:00', 'Ariyalur Town Hall', 100.00, 'ariyalur_heritage.jpg'),

(2, NULL, 'Chengalpattu Cultural Festival', 'Cultural Festival', 'Traditional cultural programs and local performances of Chengalpattu.', '2026-01-20', '10:00:00', '19:00:00', 'Chengalpattu Cultural Ground', 100.00, 'chengalpattu_cultural.jpg'),

(3, NULL, 'Chennai Music Festival', 'Music Festival', 'Music and cultural performances featuring local artists.', '2026-02-05', '17:00:00', '21:30:00', 'Chennai Music Academy', 300.00, 'chennai_music.jpg'),

(4, NULL, 'Coimbatore Food Festival', 'Food Festival', 'Food festival featuring traditional Kongu cuisine and local dishes.', '2026-02-10', '10:00:00', '21:00:00', 'Coimbatore Exhibition Ground', 150.00, 'coimbatore_food.jpg'),

(5, NULL, 'Cuddalore Beach Festival', 'Beach Festival', 'Beachside cultural programs, food stalls and entertainment activities.', '2026-02-15', '16:00:00', '21:00:00', 'Silver Beach', 100.00, 'cuddalore_beach.jpg'),

(6, NULL, 'Dharmapuri Mango Festival', 'Food Festival', 'Festival showcasing mango varieties and agricultural products.', '2026-04-10', '09:00:00', '18:00:00', 'Dharmapuri Exhibition Ground', 50.00, 'dharmapuri_mango.jpg'),

(7, NULL, 'Dindigul Food Festival', 'Food Festival', 'Traditional food festival featuring famous Dindigul cuisine.', '2026-02-20', '10:00:00', '21:00:00', 'Dindigul Town Ground', 100.00, 'dindigul_food.jpg'),

(8, NULL, 'Erode Textile Festival', 'Trade Festival', 'Exhibition showcasing handloom, textiles and traditional products.', '2026-03-05', '09:00:00', '18:00:00', 'Erode Exhibition Centre', 75.00, 'erode_textile.jpg'),

(9, NULL, 'Kallakurichi Cultural Festival', 'Cultural Festival', 'Traditional music, dance and cultural activities of Kallakurichi.', '2026-03-10', '10:00:00', '19:00:00', 'Kallakurichi Cultural Centre', 50.00, 'kallakurichi_cultural.jpg'),

(10, NULL, 'Kanchipuram Silk Festival', 'Handicraft Festival', 'Exhibition of traditional Kanchipuram silk sarees and weaving products.', '2026-03-15', '09:00:00', '18:00:00', 'Kanchipuram Exhibition Ground', 100.00, 'kanchipuram_silk.jpg'),

(11, NULL, 'Kanyakumari Tourism Festival', 'Tourism Festival', 'Tourism and cultural activities celebrating the heritage of Kanyakumari.', '2026-04-01', '10:00:00', '21:00:00', 'Kanyakumari Beach', 100.00, 'kanyakumari_festival.jpg'),

(12, NULL, 'Karur Handloom Festival', 'Handloom Festival', 'Exhibition of handloom textiles and traditional weaving products.', '2026-03-20', '09:00:00', '18:00:00', 'Karur Exhibition Hall', 50.00, 'karur_handloom.jpg'),

(13, NULL, 'Krishnagiri Mango Festival', 'Agricultural Festival', 'Festival showcasing mango varieties and agricultural products.', '2026-05-10', '09:00:00', '18:00:00', 'Krishnagiri Agricultural Ground', 50.00, 'krishnagiri_mango.jpg'),

(14, NULL, 'Madurai Chithirai Festival', 'Religious Festival', 'Major cultural and religious celebration featuring traditional processions and programs.', '2026-04-25', '06:00:00', '22:00:00', 'Madurai City', 0.00, 'madurai_chithirai.jpg'),

(15, NULL, 'Mayiladuthurai Temple Festival', 'Temple Festival', 'Traditional temple festival with cultural performances and religious activities.', '2026-03-25', '06:00:00', '21:00:00', 'Mayiladuthurai Temple Area', 0.00, 'mayiladuthurai_festival.jpg'),

(16, NULL, 'Nagapattinam Coastal Festival', 'Cultural Festival', 'Coastal cultural festival featuring traditional music, food and entertainment.', '2026-04-05', '16:00:00', '21:00:00', 'Nagapattinam Beach', 100.00, 'nagapattinam_festival.jpg'),

(17, NULL, 'Namakkal Temple Festival', 'Religious Festival', 'Traditional religious celebration with cultural programs and temple activities.', '2026-03-30', '06:00:00', '21:00:00', 'Namakkal Town', 0.00, 'namakkal_festival.jpg'),

(18, NULL, 'Nilgiris Summer Festival', 'Tourism Festival', 'Summer festival featuring flower shows, cultural programs and exhibitions.', '2026-05-15', '09:00:00', '19:00:00', 'Ooty', 200.00, 'nilgiris_summer.jpg'),

(19, NULL, 'Perambalur Heritage Festival', 'Heritage Festival', 'Festival highlighting the historical and cultural heritage of Perambalur.', '2026-04-12', '09:00:00', '18:00:00', 'Perambalur Town Ground', 50.00, 'perambalur_heritage.jpg'),

(20, NULL, 'Pudukkottai Heritage Festival', 'Heritage Festival', 'Historical exhibition and cultural programs celebrating Pudukkottai heritage.', '2026-04-18', '09:00:00', '19:00:00', 'Pudukkottai Palace Grounds', 100.00, 'pudukkottai_heritage.jpg'),

(21, NULL, 'Ramanathapuram Coastal Festival', 'Cultural Festival', 'Traditional coastal festival featuring folk arts, music and food.', '2026-05-01', '16:00:00', '21:00:00', 'Ramanathapuram Beach Area', 100.00, 'ramanathapuram_festival.jpg'),

(22, NULL, 'Ranipet Leather Exhibition', 'Trade Exhibition', 'Exhibition showcasing leather products and local industries.', '2026-04-20', '09:00:00', '18:00:00', 'Ranipet Exhibition Centre', 75.00, 'ranipet_leather.jpg'),

(23, NULL, 'Salem Mango Festival', 'Food Festival', 'Festival featuring local mango varieties, food stalls and cultural activities.', '2026-05-20', '09:00:00', '20:00:00', 'Salem Exhibition Ground', 100.00, 'salem_mango.jpg'),

(24, NULL, 'Sivaganga Chettinad Festival', 'Cultural Festival', 'Traditional Chettinad food, architecture, music and cultural exhibition.', '2026-05-25', '10:00:00', '21:00:00', 'Chettinad Heritage Centre', 150.00, 'sivaganga_chettinad.jpg'),

(25, NULL, 'Tenkasi Waterfalls Festival', 'Tourism Festival', 'Tourism festival celebrating waterfalls, nature and local culture.', '2026-06-10', '09:00:00', '19:00:00', 'Courtallam', 100.00, 'tenkasi_waterfalls.jpg'),

(26, NULL, 'Thanjavur Art Festival', 'Art Festival', 'Traditional painting, dance, music and handicraft exhibition.', '2026-06-15', '10:00:00', '21:00:00', 'Thanjavur Palace Grounds', 200.00, 'thanjavur_art.jpg'),

(27, NULL, 'Theni Nature Festival', 'Nature Festival', 'Nature awareness programs, trekking activities and local cultural events.', '2026-06-20', '08:00:00', '18:00:00', 'Theni Eco Park', 100.00, 'theni_nature.jpg'),

(28, NULL, 'Thoothukudi Sea Festival', 'Coastal Festival', 'Coastal celebration featuring seafood, traditional music and cultural programs.', '2026-06-25', '16:00:00', '22:00:00', 'Thoothukudi Beach', 150.00, 'thoothukudi_sea.jpg'),

(29, NULL, 'Tiruchirappalli Heritage Festival', 'Heritage Festival', 'Festival showcasing the historical monuments and cultural heritage of Tiruchirappalli.', '2026-07-01', '09:00:00', '20:00:00', 'Tiruchirappalli Heritage Centre', 100.00, 'trichy_heritage.jpg'),

(30, NULL, 'Tirunelveli Halwa Festival', 'Food Festival', 'Food festival celebrating the famous traditional Tirunelveli halwa.', '2026-07-05', '10:00:00', '21:00:00', 'Tirunelveli Exhibition Ground', 100.00, 'tirunelveli_halwa.jpg'),

(31, NULL, 'Tirupathur Hill Festival', 'Tourism Festival', 'Nature and tourism festival featuring hill activities and cultural programs.', '2026-07-10', '08:00:00', '18:00:00', 'Tirupathur Hill Area', 100.00, 'tirupathur_hill.jpg'),

(32, NULL, 'Tiruppur Textile Expo', 'Trade Exhibition', 'Textile and garment exhibition showcasing local products.', '2026-07-15', '09:00:00', '18:00:00', 'Tiruppur Exhibition Centre', 100.00, 'tiruppur_textile.jpg'),

(33, NULL, 'Tiruvallur Temple Festival', 'Religious Festival', 'Traditional temple festival with cultural programs and celebrations.', '2026-07-20', '06:00:00', '21:00:00', 'Tiruvallur Temple Area', 0.00, 'tiruvallur_temple.jpg'),

(34, NULL, 'Tiruvannamalai Karthigai Festival', 'Religious Festival', 'Major spiritual celebration featuring traditional religious activities.', '2026-11-20', '06:00:00', '22:00:00', 'Tiruvannamalai', 0.00, 'tiruvannamalai_karthigai.jpg'),

(35, NULL, 'Tiruvarur Temple Festival', 'Temple Festival', 'Traditional temple celebration with music, processions and cultural programs.', '2026-08-01', '06:00:00', '21:00:00', 'Tiruvarur Temple Area', 0.00, 'tiruvarur_festival.jpg'),

(36, NULL, 'Vellore Heritage Festival', 'Heritage Festival', 'Historical exhibition and cultural programs highlighting Vellore heritage.', '2026-08-05', '09:00:00', '20:00:00', 'Vellore Fort', 100.00, 'vellore_heritage.jpg'),

(37, NULL, 'Viluppuram Cultural Festival', 'Cultural Festival', 'Traditional folk dance, music and cultural programs.', '2026-08-10', '10:00:00', '20:00:00', 'Viluppuram Cultural Ground', 75.00, 'viluppuram_cultural.jpg'),

(38, NULL, 'Virudhunagar Cultural Festival', 'Cultural Festival', 'Traditional cultural programs, food stalls and local handicraft exhibition.', '2026-08-15', '10:00:00', '21:00:00', 'Virudhunagar Exhibition Ground', 100.00, 'virudhunagar_cultural.jpg');

ALTER TABLE ai_recommendations
ADD COLUMN interest VARCHAR(50) NOT NULL AFTER travel_type;

SELECT district_id, district_name
FROM districts
ORDER BY district_id;

INSERT INTO ai_recommendations
(
    recommendation_title,
    recommendation,
    travel_type,
    interest,
    best_time_to_visit,
    estimated_budget,
    district_id
)
VALUES

-- Chennai (District ID: 3)
(
    'Family Beach Trip',
    'Marina Beach and Elliot Beach are suitable for a relaxed family trip with nearby food and sightseeing options.',
    'Family',
    'Beach',
    'October - March',
    '₹3000 - ₹6000',
    3
),
(
    'Friends Beach Trip',
    'Marina Beach with beach activities and nearby attractions is suitable for a friends trip.',
    'Friends',
    'Beach',
    'October - March',
    '₹2000 - ₹5000',
    3
),
(
    'Couple Beach Trip',
    'Elliot Beach and peaceful coastal areas are suitable for a couple trip.',
    'Couple',
    'Beach',
    'October - March',
    '₹3000 - ₹7000',
    3
),
(
    'Solo Beach Trip',
    'Marina Beach and nearby attractions provide a simple solo travel experience.',
    'Solo',
    'Beach',
    'October - March',
    '₹1500 - ₹4000',
    3
),

-- Madurai (District ID: 14) - Heritage
(
    'Family Heritage Trip',
    'Meenakshi Temple and Thirumalai Nayakkar Palace provide a family-friendly heritage experience.',
    'Family',
    'Heritage',
    'October - March',
    '₹3000 - ₹6000',
    14
),
(
    'Friends Heritage Trip',
    'Madurai heritage locations provide sightseeing and cultural experiences for friends.',
    'Friends',
    'Heritage',
    'October - March',
    '₹2500 - ₹5500',
    14
),
(
    'Couple Heritage Trip',
    'Madurai heritage attractions and palace visits are suitable for a couple cultural trip.',
    'Couple',
    'Heritage',
    'October - March',
    '₹3000 - ₹6500',
    14
),
(
    'Solo Heritage Trip',
    'Meenakshi Temple and nearby historical attractions are suitable for solo exploration.',
    'Solo',
    'Heritage',
    'October - March',
    '₹1500 - ₹4000',
    14
),

-- Nilgiris (District ID: 18)
(
    'Family Nature Trip',
    'Ooty and Coonoor provide a comfortable nature trip for families.',
    'Family',
    'Nature',
    'October - June',
    '₹5000 - ₹10000',
    18
),
(
    'Friends Nature Trip',
    'Ooty and Coonoor offer sightseeing and outdoor experiences for friends.',
    'Friends',
    'Nature',
    'October - June',
    '₹4000 - ₹9000',
    18
),
(
    'Couple Nature Trip',
    'Ooty provides scenic and peaceful locations suitable for couples.',
    'Couple',
    'Nature',
    'October - June',
    '₹5000 - ₹10000',
    18
),
(
    'Solo Nature Trip',
    'Ooty and Coonoor provide scenic locations for independent travel.',
    'Solo',
    'Nature',
    'October - June',
    '₹3000 - ₹7000',
    18
),

-- Ramanathapuram (District ID: 21)
(
    'Family Temple Trip',
    'Ramanathaswamy Temple and nearby attractions are suitable for a family pilgrimage trip.',
    'Family',
    'Temple',
    'October - March',
    '₹4000 - ₹8000',
    21
),
(
    'Friends Temple Trip',
    'Rameswaram temple and nearby attractions provide a cultural trip for friends.',
    'Friends',
    'Temple',
    'October - March',
    '₹3500 - ₹7500',
    21
),
(
    'Couple Temple Trip',
    'Ramanathaswamy Temple and nearby peaceful attractions are suitable for couples.',
    'Couple',
    'Temple',
    'October - March',
    '₹4000 - ₹8000',
    21
),
(
    'Solo Temple Trip',
    'Ramanathaswamy Temple and nearby attractions are suitable for solo cultural exploration.',
    'Solo',
    'Temple',
    'October - March',
    '₹2500 - ₹6000',
    21
),

-- Madurai (District ID: 14) - Food
(
    'Family Food Trip',
    'Madurai food streets and Jigarthanda are suitable for a family food experience.',
    'Family',
    'Food',
    'Throughout the year',
    '₹1500 - ₹3500',
    14
),
(
    'Friends Food Trip',
    'Madurai food streets and local specialties are suitable for a friends food trip.',
    'Friends',
    'Food',
    'Throughout the year',
    '₹1000 - ₹3000',
    14
),
(
    'Couple Food Trip',
    'Madurai local food streets and Jigarthanda provide a memorable food experience for couples.',
    'Couple',
    'Food',
    'Throughout the year',
    '₹1500 - ₹3500',
    14
),
(
    'Solo Food Trip',
    'Madurai food streets provide an easy and affordable solo food experience.',
    'Solo',
    'Food',
    'Throughout the year',
    '₹800 - ₹2500',
    14
);

DESCRIBE ai_recommendations;