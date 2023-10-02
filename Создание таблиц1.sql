-- Создание таблицы Channel
CREATE TABLE Channel (
    channel_id INT PRIMARY KEY,
    channel_name VARCHAR(255),
    channel_description TEXT,
    channel_logo_url VARCHAR(255),
    website_url VARCHAR(255)
);

-- Создание таблицы Schedule
CREATE TABLE Schedule (
    schedule_id INT PRIMARY KEY,
    channel_id INT,
    show_name VARCHAR(255),
    show_start_time DATETIME,
    show_end_time DATETIME,
    FOREIGN KEY (channel_id) REFERENCES Channel(channel_id)
);

-- Создание таблицы Employee
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    employee_position VARCHAR(255),
    employee_email VARCHAR(255)
);

-- Создание таблицы Advertiser
CREATE TABLE Advertiser (
    advertiser_id INT PRIMARY KEY,
    advertiser_name VARCHAR(255),
    advertiser_contact_person VARCHAR(255),
    advertiser_contact_email VARCHAR(255)
);

-- Создание таблицы Ad
CREATE TABLE Ad (
    ad_id INT PRIMARY KEY,
    advertiser_id INT,
    ad_name VARCHAR(255),
    ad_description TEXT,
    ad_duration INT,
    ad_start_time DATETIME,
    ad_end_time DATETIME,
    FOREIGN KEY (advertiser_id) REFERENCES Advertiser(advertiser_id)
);

-- Создание таблицы Employee_Schedule
CREATE TABLE Employee_Schedule (
    employee_id INT,
    schedule_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (schedule_id) REFERENCES Schedule(schedule_id)
);

-- Создание таблицы Ad_Schedule
CREATE TABLE Ad_Schedule (
    ad_id INT,
    schedule_id INT,
    FOREIGN KEY (ad_id) REFERENCES Ad(ad_id),
    FOREIGN KEY (schedule_id) REFERENCES Schedule(schedule_id)
);

-- Создание таблицы Ad_Channel
CREATE TABLE Ad_Channel (
    ad_id INT,
    channel_id INT,
    FOREIGN KEY (ad_id) REFERENCES Ad(ad_id),
    FOREIGN KEY (channel_id) REFERENCES Channel(channel_id)
);

-- Создание таблицы Ad_Schedule_Channel
CREATE TABLE Ad_Schedule_Channel (
    ad_schedule_id INT,
    channel_id INT,
    FOREIGN KEY (ad_schedule_id) REFERENCES Ad_Schedule(ad_id),
    FOREIGN KEY (channel_id) REFERENCES Channel(channel_id)
);

-- Создание таблицы Employee_Channel
CREATE TABLE Employee_Channel (
    employee_id INT,
    channel_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (channel_id) REFERENCES Channel(channel_id)
);

-- Создание таблицы Article
CREATE TABLE Article (
    article_id INT PRIMARY KEY,
    channel_id INT,
    article_title VARCHAR(255),
    article_content TEXT,
    article_publish_date DATETIME,
    FOREIGN KEY (channel_id) REFERENCES Channel(channel_id)
);

-- Создание таблицы Video
CREATE TABLE Video (
    video_id INT PRIMARY KEY,
    channel_id INT,
    video_title VARCHAR(255),
    video_description TEXT,
    video_url VARCHAR(255),
    video_publish_date DATETIME,
    FOREIGN KEY (channel_id) REFERENCES Channel(channel_id)
);
