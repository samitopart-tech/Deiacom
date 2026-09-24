<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>deiacom - ديا كوم | قمة العصرية في خدمات الحاسوب</title>
    
    <!-- Font Awesome (Icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <!-- Google Font (Poppins & Cairo) -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700;800&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-blue: #2448a5;      /* لون شعار deia */
            --secondary-orange: #f26f21;  /* لون شعار deia */
            --text-dark: #111827;
            --text-muted: #6b7280;
            --glass-bg: rgba(255, 255, 255, 0.4); /* خلفية زجاجية شفافة */
            --glass-border: rgba(255, 255, 255, 0.2);
            --gradient-1: linear-gradient(135deg, #f8fafc 0%, #e0f2fe 100%); /* خلفية متدرجة */
            --blur: blur(20px); /* كثافة البلور */
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Cairo', 'Poppins', sans-serif;
            transition: all 0.3s ease;
        }

        body {
            background: var(--gradient-1); /* خلفية ديناميكية */
            color: var(--text-dark);
            overflow-x: hidden;
            position: relative;
        }

        /* دوائر خلفية لتأثير الزجاج */
        .bg-circle {
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            z-index: -1;
        }
        .circle-1 {
            width: 400px; height: 400px;
            background: rgba(36, 72, 165, 0.2);
            top: -100px; left: -100px;
        }
        .circle-2 {
            width: 300px; height: 300px;
            background: rgba(242, 111, 33, 0.15);
            bottom: -50px; right: 10%;
        }

        /* Glassmorphism Styles */
        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: var(--blur);
            -webkit-backdrop-filter: var(--blur);
            border: 1px solid var(--glass-border);
            border-radius: 20px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.07);
        }

        /* Header */
        header {
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .nav-container.glass-nav {
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(15px);
            border-bottom: 1px solid var(--glass-border);
        }
        .logo-container {
            display: flex;
            align-items: center;
            text-decoration: none;
        }
        .logo-container img {
            height: 45px;
            margin-left: 10px;
        }
        .logo-container span {
            font-size: 26px;
            font-weight: 800;
            color: var(--primary-blue);
        }
        .logo-container span.orange {
            color: var(--secondary-orange);
            font-weight: 700;
        }

        .nav-links {
            display: flex;
            gap: 25px;
            list-style: none;
        }
        .nav-links a {
            text-decoration: none;
            color: var(--primary-blue);
            font-weight: 600;
            font-size: 1rem;
        }
        .nav-links a:hover {
            color: var(--secondary-orange);
        }

        .btn-call-nav {
            background: var(--secondary-orange);
            color: #fff !important;
            padding: 10px 22px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 15px rgba(242, 111, 33, 0.3);
        }
        .btn-call-nav:hover {
            background: #d35c15;
            transform: translateY(-2px);
        }

        /* Hero Section */
        .hero {
            max-width: 1200px;
            margin: 60px auto;
            padding: 40px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 30px;
        }
        .hero-text {
            flex: 1;
        }
        .hero-text h1 {
            font-size: 3.2rem;
            color: var(--primary-blue);
            line-height: 1.2;
            font-weight: 800;
            margin-bottom: 25px;
        }
        .hero-text h1 span {
            color: var(--secondary-orange);
            font-weight: 700;
        }
        .hero-text p {
            font-size: 1.2rem;
            color: var(--text-muted);
            margin-bottom: 40px;
            max-width: 550px;
        }
        .hero-buttons {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .btn-main, .btn-whatsapp {
            padding: 14px 30px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            font-size: 1.05rem;
        }
        .btn-main {
            background: var(--primary-blue);
            color: #fff;
        }
        .btn-main:hover {
            background: #193375;
            box-shadow: 0 10px 25px rgba(36, 72, 165, 0.3);
        }
        .btn-whatsapp {
            background: #25D366;
            color: #fff;
        }
        .btn-whatsapp:hover {
            background: #1eb855;
            box-shadow: 0 10px 25px rgba(37, 211, 102, 0.3);
        }

        .hero-image {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        /* تأثير العنصر ثلاثي الأبعاد */
        .hero-image .glass-3d-box {
            width: 320px;
            height: 320px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        .hero-image .glass-3d-box::after {
            content: "\f109"; /* Laptop icon */
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            font-size: 10rem;
            color: var(--primary-blue);
            position: absolute;
            opacity: 0.15;
            filter: blur(2px);
            animation: float 5s ease-in-out infinite;
        }
        .hero-image img {
            width: 100%;
            height: auto;
            max-width: 400px;
            object-fit: contain;
            filter: drop-shadow(0 15px 30px rgba(0,0,0,0.15));
            animation: float 4s ease-in-out infinite;
        }

        /* Services */
        .section-title {
            text-align: center;
            margin: 80px 0 50px;
        }
        .section-title h2 {
            font-size: 2.5rem;
            color: var(--primary-blue);
            font-weight: 800;
        }
        .section-title h2 span {
            color: var(--secondary-orange);
            font-weight: 700;
        }

        .services-grid {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }

        .service-card-glass {
            padding: 40px;
            text-align: center;
        }
        .service-card-glass:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 45px rgba(31, 38, 135, 0.15);
        }
        .service-card-glass .icon-box {
            width: 80px;
            height: 80px;
            background: rgba(36, 72, 165, 0.1);
            color: var(--primary-blue);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            margin: 0 auto 30px;
        }
        .service-card-glass h3 {
            color: var(--primary-blue);
            font-size: 1.4rem;
            margin-bottom: 15px;
            font-weight: 700;
        }
        .service-card-glass p {
            color: var(--text-muted);
            font-size: 1rem;
        }

        /* Contact Section */
        .contact-section {
            max-width: 1200px;
            margin: 90px auto 50px;
            padding: 0 20px;
        }
        .info-box-glass {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            padding: 60px;
        }
        .info-item {
            display: flex;
            align-items: flex-start;
            gap: 20px;
        }
        .info-item i {
            font-size: 2.2rem;
            color: var(--primary-blue);
            margin-top: 5px;
        }
        .info-item h4 {
            font-size: 1.3rem;
            color: var(--text-dark);
            margin-bottom: 8px;
            font-weight: 700;
        }
        .info-item p, .info-item a {
            color: var(--text-muted);
            text-decoration: none;
            font-size: 1rem;
        }
        .info-item a:hover {
            color: var(--secondary-orange);
        }

        /* Floating WhatsApp */
        .whatsapp-float {
            position: fixed;
            bottom: 30px;
            left: 30px;
            background-color: #25D366;
            color: white;
            border-radius: 50px;
            padding: 14px 25px;
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 700;
            box-shadow: 0 8px 25px rgba(37, 211, 102, 0.4);
            z-index: 999;
            text-decoration: none;
            font-size: 1.1rem;
        }
        .whatsapp-float:hover {
            transform: scale(1.05);
            background-color: #1eb855;
        }

        footer {
            text-align: center;
            padding: 30px;
            color: var(--text-muted);
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(10px);
            margin-top: 60px;
            border-top: 1px solid var(--glass-border);
        }

        /* Animations */
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }

        /* Media Queries */
        @media (max-width: 992px) {
            .hero {
                flex-direction: column;
                text-align: center;
                margin-top: 40px;
            }
            .hero-text {
                margin-bottom: 50px;
            }
            .hero-text h1 {
                font-size: 2.6rem;
            }
            .hero-buttons {
                justify-content: center;
            }
            .nav-links {
                display: none;
            }
        }
        @media (max-width: 768px) {
            .hero-text h1 {
                font-size: 2.2rem;
            }
            .service-card-glass {
                padding: 30px;
            }
            .info-box-glass {
                padding: 40px;
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- دوائر الخلفية لتأثير الزجاج -->
    <div class="bg-circle circle-1"></div>
    <div class="bg-circle circle-2"></div>

    <!-- شريط التنقل الزجاجي (Glass Nav) -->
    <header>
        <div class="nav-container glass-card glass-nav">
            <a href="#" class="logo-container">
                <img src="https://i.ibb.co/5Mvj4qP/image-0.png" alt="deiacom Logo"> <!-- تأكد من استضافة الشعار ووضع رابط هنا -->
            </a>
            <ul class="nav-links">
                <li><a href="#services">الخدمات</a></li>
                <li><a href="#location">موقعنا</a></li>
            </ul>
            <a href="tel:777221994" class="btn-call-nav">
                <i class="fa-solid fa-phone"></i> 777221994
            </a>
        </div>
    </header>

    <!-- القسم الرئيسي العصري (Hero Section) -->
    <section class="hero">
        <div class="hero-text">
            <h1>التكنولوجيا الحديثة، <br> لـ <span>حاسوبك وطابعتك</span></h1>
            <p>مرحباً بكم في <strong>deiacom</strong>. نحن نضع بين أيديكم أحدث ملحقات الكمبيوتر، صيانة الطابعات الاحترافية، وتوفير كافة مستلزمات الطباعة في صنعاء بجودة عالمية وعصرية.</p>
            <div class="hero-buttons">
                <a href="https://wa.me/967777221994" target="_blank" class="btn-whatsapp">
                    <i class="fa-brands fa-whatsapp fa-xl"></i> تواصل عبر واتساب
                </a>
                <a href="tel:777221994" class="btn-main">
                    <i class="fa-solid fa-paper-plane"></i> اتصال مباشر
                </a>
            </div>
        </div>
        <div class="hero-image">
            <div class="glass-3d-box glass-card">
                <!-- هنا يمكنك وضع صورة عصرية شفافة (PNG) للابتوب وطابعة -->
                <img src="https://cdni.iconscout.com/illustration/premium/thumb/laptop-repairing-service-8610368-6933390.png" alt="deiacom services illustration">
            </div>
        </div>
    </section>

    <!-- قسم الخدمات (Glass Cards) -->
    <section id="services">
        <div class="section-title">
            <h2>أبرز خدماتنا و <span>منتجاتنا</span></h2>
        </div>
        <div class="services-grid">
            <div class="service-card-glass glass-card">
                <div class="icon-box"><i class="fa-solid fa-print"></i></div>
                <h3>مستلزمات الطابعات الأحبار</h3>
                <p>تعبئة أحبار ليزر ومحاليل، رولات صيانة، وقطع غيار لجميع طابعات HP و Canon الأصلية.</p>
            </div>

            <div class="service-card-glass glass-card">
                <div class="icon-box"><i class="fa-solid fa-keyboard"></i></div>
                <h3>اكسسوارات وملحقات</h3>
                <p>كيبوردات، ماوسات جيمنج ومكتبي، سماعات احترافية، وكل ما تحتاجه لتجربة مستخدم عصرية.</p>
            </div>

            <div class="service-card-glass glass-card">
                <div class="icon-box"><i class="fa-solid fa-memory"></i></div>
                <h3>قطع غيار وترقيات</h3>
                <p>هاردات SSD سريعة، رامات، شواحن أصلي، وبطاريات لابتوب لتعزيز أداء جهازك بشكل جذري.</p>
            </div>
        </div>
    </section>

    <!-- قسم الموقع والاتصال (Glass Container) -->
    <section class="contact-section" id="location">
        <div class="info-box-glass glass-card">
            <div class="info-item">
                <i class="fa-solid fa-map-location-dot"></i>
                <div>
                  <h4>موقع المحل</h4>
                  <p>صنعاء - جولة الجامعة الجديدة - بداية شارع العدل</p>
                </div>
            </div>

            <div class="info-item">
                <i class="fa-solid fa-mobile-retro"></i>
                <div>
                  <h4>الهاتف و واتساب</h4>
                  <p><a href="tel:777221994" dir="ltr">+967 777 221 994</a></p>
                </div>
            </div>

            <div class="info-item">
                <i class="fa-solid fa-store"></i>
                <div>
                  <h4>ساعات العمل</h4>
                  <p>يومياً، نسعد بخدمتكم في أي وقت</p>
                </div>
            </div>
        </div>
    </section>

    <!-- زر واتساب العائم العصري -->
    <a href="https://wa.me/967777221994?text=السلام%20عليكم،%20أرغب%20في%20الاستفسار%20عن%20خدماتكم" class="whatsapp-float" target="_blank">
        <i class="fa-brands fa-whatsapp fa-xl"></i>
        <span>استفسر الآن</span>
    </a>

    <!-- Footer -->
    <footer>
        <p>جميع الحقوق محفوظة &copy; 2026 - <strong>deiacom for computer services</strong></p>
    </footer>

</body>
</html>
