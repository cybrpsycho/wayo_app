class MockApi {
  static final malls = [
    {
      "id": 1,
      "name": "ABC Place",
      "coordinates": {"lat": -1.2598, "long": 36.77739},
      "physical_address": "ABC Place, Waiyaki Way, Lavington, Nairobi",
      "phone_numbers": ["+254204440362", "+254715456222"],
      "email": "info@abc-place.com",
      "hours": {
        "fri": "8:00AM-11:00PM",
        "mon": "8:00AM-11:00PM",
        "sat": "8:00AM-11:00PM",
        "sun": "8:00AM-11:00PM",
        "thu": "8:00AM-11:00PM",
        "tue": "8:00AM-11:00PM",
        "wed": "8:00AM-11:00PM"
      },
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fabc-logo.jpg?alt=media&token=a34648bd-e8bf-4fa9-8755-8f00592197d4",
      "published": false,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 2,
      "name": "Lavington Mall",
      "coordinates": {"lat": -1.28006, "long": 36.77015},
      "physical_address": "Muthangari Green, Lavington, Nairobi",
      "phone_numbers": ["+254719142527"],
      "email": null,
      "hours": {
        "fri": "6:00AM-10:00PM",
        "mon": "6:00AM-10:00PM",
        "sat": "6:00AM-10:00PM",
        "sun": "6:00AM-10:00PM",
        "thu": "6:00AM-10:00PM",
        "tue": "6:00AM-10:00PM",
        "wed": "6:00AM-10:00PM"
      },
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Flavington-mall-logo.jpg?alt=media&token=3af96df0-7bd3-4bba-b23a-20b5ff66a423",
      "published": false,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 3,
      "name": "Yaya Center",
      "coordinates": {"lat": -1.29293, "long": 36.78782},
      "physical_address": "Argwings Kodhek Road, Kilimani, Nairobi",
      "phone_numbers": ["+254709439000", "+254722200427"],
      "email": "info@yaya.co.ke",
      "hours": {
        "fri": "9:30AM-6:30PM",
        "mon": "9:30AM-6:30PM",
        "sat": "9:30AM-6:30PM",
        "sun": "9:30AM-6:30PM",
        "thu": "9:30AM-6:30PM",
        "tue": "9:30AM-6:30PM",
        "wed": "9:30AM-6:30PM"
      },
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fyaya-logo.jpg?alt=media&token=aef16782-74f1-403a-9f21-9177ba03cb8d",
      "published": false,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 4,
      "name": "Sarit Center",
      "coordinates": {"lat": -1.26079, "long": 36.80173},
      "physical_address": "Karuna Road, Westlands, Nairobi",
      "phone_numbers": ["+254111040600"],
      "email": "info@saritcentre.com",
      "hours": {
        "fri": "6:00AM-11:30PM",
        "mon": "6:00AM-11:30PM",
        "sat": "6:00AM-11:30PM",
        "sun": "6:00AM-11:30PM",
        "thu": "6:00AM-11:30PM",
        "tue": "6:00AM-11:30PM",
        "wed": "6:00AM-11:30PM"
      },
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fsarit-logo.jpg?alt=media&token=9c7c70f8-fae7-4c56-8f4a-3e3ff32eb527",
      "model_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/models%2Fsarit.glb?alt=media&token=1d2513e3-8788-4fde-bef0-6a39934f9547",
      "published": false,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 5,
      "name": "The Hub",
      "coordinates": {"lat": -1.32041, "long": 36.70379},
      "physical_address": "Dagoretti Road, Karen, Nairobi",
      "phone_numbers": ["+254702120120"],
      "email": "info@thehubkaren.com",
      "hours": {
        "fri": "8:00AM-11:00PM",
        "mon": "8:00AM-11:00PM",
        "sat": "8:00AM-11:00PM",
        "sun": "8:00AM-11:00PM",
        "thu": "8:00AM-11:00PM",
        "tue": "8:00AM-11:00PM",
        "wed": "8:00AM-11:00PM"
      },
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fthe-hub-logo.jpg?alt=media&token=79d7ca68-9e1d-4807-8eac-7bb56713199c",
      "published": false,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 6,
      "name": "Two Rivers",
      "coordinates": {"lat": -1.21107, "long": 36.79505},
      "physical_address": "Limuru Road, Rosslyn, Nairobi",
      "phone_numbers": ["+254709190511", "+254709190508"],
      "email": "customerservice@tworivers.co.ke",
      "hours": {
        "fri": "7:00AM-11:00PM",
        "mon": "7:00AM-11:00PM",
        "sat": "7:00AM-11:00PM",
        "sun": "7:00AM-11:00PM",
        "thu": "7:00AM-11:00PM",
        "tue": "7:00AM-11:00PM",
        "wed": "7:00AM-11:00PM"
      },
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Ftwo-rivers-logo.jpg?alt=media&token=db856724-7aeb-47fd-bfe5-6846ad355dab",
      "asset_urls": [
        "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/featured%2Ftwo-rivers01.jpeg?alt=media&token=f0decc3b-a134-4510-9685-dcd2bdd45ea1"
      ],
      "published": false,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    }
  ];

  static final stores = [
    {
      "id": 1,
      "name": "Mugg & Bean",
      "description":
          "Mugg & Bean sit-down restaurants are the place where friends and loved ones gather to relax and reconnect over good conversation and great food. It’s much more than a coffee shop, it’s your home away from home, where you arrive as a customer and leave as a friend. Whether you’re in the mood for a world-class coffee, a decadent slice of freshly baked cake, a wholesome salad, a gourmet burger or a grill, M&B is the place to be! So, make that coffee Bottomless and stay a while longer.",
      "phone_numbers": null,
      "email": "muggnbean@gmail.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fmugg-n-bean-logo.jpg?alt=media&token=f1e7876f-c0ab-4d07-bfb5-0a358e52d7ff",
      "feature_image":
          "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?cs=srgb&dl=pexels-ash-376464.jpg&fm=jpg&w=1280&h=782",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 2,
      "name": "Burger King",
      "description":
          "Founded in 1954, BURGER KING® is a global, quick-service restaurant chain with over 12,100 locations in 74 countries that serves more than 11.4 million people daily. That’s a lot of flame-broiled tastiness going into lots of different mouths that speak lots of different languages. BURGER KING® restaurants are also the home of the world-famous WHOPPER® sandwich.",
      "phone_numbers": null,
      "email": "burgerking@gmail.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fburger-king-logo.jpg?alt=media&token=b6123d89-698b-4c0a-99b2-9769a2d12f96",
      "feature_image":
          "https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?cs=srgb&dl=pexels-robin-stickel-70497.jpg&fm=jpg&w=1280&h=851",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 3,
      "name": "Miniso",
      "description":
          "The MINISO Brand founder Jack Ye gained inspiration for MINISO while on vacation  with his family in Japan in 2013. He came across several specialty stores which  stocked good quality, well designed, and inexpensive products that were mostly manufac-tured in China. With his knowledge and experience in product development, supply chain,  and the fashion industry, Jack established MINISO with its headquarters in Guangzhou,  China, a brand catering to young people around the world.",
      "phone_numbers": ["+254743277231"],
      "email": "miniso.kenya@miniso.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fminiso-logo.jpg?alt=media&token=c8e16b08-a490-4b41-a313-b8503de27cb5",
      "feature_image":
          "https://images.pexels.com/photos/5531015/pexels-photo-5531015.jpeg?cs=srgb&dl=pexels-rachel-claire-5531015.jpg&fm=jpg&w=1280&h=853",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 4,
      "name": "Manix Clothing",
      "description": null,
      "phone_numbers": ["+254788567200"],
      "email": "manix@gmail.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fmanix-logo.jpg?alt=media&token=c33c0ab6-903d-4948-b44a-3471b6b6309f",
      "feature_image":
          "https://images.pexels.com/photos/1488463/pexels-photo-1488463.jpeg?cs=srgb&dl=pexels-edgars-kisuro-1488463.jpg&fm=jpg&w=1280&h=853",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 5,
      "name": "Levis",
      "description":
          "What started as an invention for the American worker became the uniform of progress. Worn by miners, cowboys, rebels, rock stars, presidents and everyday men and women, these functional pieces were the clothes people not only worked in—they lived their lives in, too.",
      "phone_numbers": null,
      "email": "levis@gmail.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Flevis-logo.jpg?alt=media&token=2c7b5048-8c8d-41db-95dc-f487dd573075",
      "feature_image":
          "https://images.pexels.com/photos/14528152/pexels-photo-14528152.jpeg?cs=srgb&dl=pexels-victor-coutant-14528152.jpg&fm=jpg&w=1280&h=853",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 6,
      "name": "Galitos",
      "description":
          "For over a decade, Galito’s has fired up Kenya with mouth-watering and unbeatable #BoldAfricanFlavour and has consistently grown with presence in Nairobi, Mombasa, Nakuru, Kisumu and Kiambu counties.",
      "phone_numbers": null,
      "email": "galitos@gmail.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fgalitos-logo.jpg?alt=media&token=09b42d07-9fcd-4b7b-a209-1dbc70bb4c5f",
      "feature_image":
          "https://images.pexels.com/photos/2673353/pexels-photo-2673353.jpeg?cs=srgb&dl=pexels-engin-akyurt-2673353.jpg&fm=jpg&w=1280&h=854",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 7,
      "name": "Mr Price",
      "description":
          "We like to think of ourselves as a bunch of fashion obsessed individuals who know how to save a buck or two! From the hottest trends to wardrobe must-haves, we’ve got the whole family sorted season after season.",
      "phone_numbers": null,
      "email": "mrp@gmail.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fmrp-logo.jpg?alt=media&token=2b4491b3-e109-4750-a62e-065e967d6cdc",
      "feature_image":
          "https://images.pexels.com/photos/3768005/pexels-photo-3768005.jpeg?cs=srgb&dl=pexels-willo-m-3768005.jpg&fm=jpg&w=1280&h=960",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 8,
      "name": "Nike",
      "description":
          "NIKE, Inc. is a team comprised of the Nike, Jordan and Converse brands driven by a shared purpose to leave an enduring impact.",
      "phone_numbers": null,
      "email": "nike@gmail.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fnike-logo.jpg?alt=media&token=3c14d2a1-3f18-421c-8d56-50c575324848",
      "feature_image":
          "https://images.pexels.com/photos/1884581/pexels-photo-1884581.jpeg?cs=srgb&dl=pexels-tembela-bohle-1884581.jpg&fm=jpg&w=1280&h=853",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 9,
      "name": "Textbook Center",
      "description":
          "Text Book Centre (TBC) is East and Central Africa's largest Educational, Cultural and Technological Content and Products Distributor. It was founded in 1964 as a partnership between two businessmen in Kenya, Mr. S V Shah and Mr. M J Rughani. TBC has over the years grown tremendously to become the leading bookstore chain in Kenya. Its retail, wholesale and distribution services have unrivalled capacity to meet the demands of Kenya's vibrant education sector.",
      "phone_numbers": ["+254111011300", "+254114509617"],
      "email": "online.orders@tbc.co.ke",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Ftbc-logo.jpg?alt=media&token=dd784d46-e82e-4fff-b3f3-f7c410ed901c",
      "feature_image":
          "https://images.pexels.com/photos/4219101/pexels-photo-4219101.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4219101.jpg&fm=jpg&w=1280&h=1920",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 10,
      "name": "Woolworths",
      "description": null,
      "phone_numbers": null,
      "email": "woolworths@gmail.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fwoolworths-logo.jpg?alt=media&token=df4d6548-e00b-428d-a2c2-b34023095d60",
      "feature_image":
          "https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?cs=srgb&dl=pexels-kai-pilger-996329.jpg&fm=jpg&w=1280&h=853",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 11,
      "name": "Urban Burger",
      "description": null,
      "phone_numbers": ["+254709276666"],
      "email": "urban@gmail.com",
      "manager_id": 2,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Furban-burger-logo.jpg?alt=media&token=d97d9f20-7007-4d1d-bea3-e3698d196a63",
      "feature_image":
          "https://images.pexels.com/photos/1199959/pexels-photo-1199959.jpeg?cs=srgb&dl=pexels-valeria-boltneva-1199959.jpg&fm=jpg&w=1280&h=1720",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    }
  ];

  static final branches = [
    {
      "id": 1,
      "mall_id": 4,
      "company_id": 1,
      "category_id": 3,
      "name": "Mugg & Bean",
      "floor": "-1",
      "storeModelName": "Curve074",
      "phone_numbers": ["+254768821947"],
      "email": null,
      "hours": {
        "fri": "7:00AM-10:00PM",
        "mon": "7:00AM-10:00PM",
        "sat": "7:00AM-10:00PM",
        "sun": "7:00AM-10:00PM",
        "thu": "7:00AM-10:00PM",
        "tue": "7:00AM-10:00PM",
        "wed": "7:00AM-10:00PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fmugg-n-bean-logo.jpg?alt=media&token=f1e7876f-c0ab-4d07-bfb5-0a358e52d7ff",
      "asset_urls": [
        "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/featured%2Fmugg-n-bean01.jpg?alt=media&token=1dde167e-1bb0-40ee-9ede-e7ade6a4b5b3",
        "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/featured%2Fmugg-n-bean02.jpeg?alt=media&token=90d2e528-d728-453b-9215-eb931511747c"
      ],
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 2,
      "mall_id": 5,
      "company_id": 2,
      "category_id": 5,
      "name": "Burger King",
      "floor": "0",
      "phone_numbers": ["+254700000000"],
      "email": "burgerk.ke@gmail.com",
      "hours": {
        "fri": "10:00AM-9:00PM",
        "mon": "10:00AM-9:00PM",
        "sat": "10:00AM-9:00PM",
        "sun": "10:00AM-9:00PM",
        "thu": "10:00AM-9:00PM",
        "tue": "10:00AM-9:00PM",
        "wed": "10:00AM-9:00PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fburger-king-logo.jpg?alt=media&token=b6123d89-698b-4c0a-99b2-9769a2d12f96",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 3,
      "mall_id": 6,
      "company_id": 2,
      "category_id": 5,
      "name": "Burger King",
      "floor": "0",
      "phone_numbers": ["+254700000000"],
      "email": "burgerk.ke@gmail.com",
      "hours": {
        "fri": "11:00AM-8:30PM",
        "mon": "11:00AM-8:30PM",
        "sat": "11:00AM-8:30PM",
        "sun": "11:00AM-8:30PM",
        "thu": "11:00AM-8:30PM",
        "tue": "11:00AM-8:30PM",
        "wed": "11:00AM-8:30PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fburger-king-logo.jpg?alt=media&token=b6123d89-698b-4c0a-99b2-9769a2d12f96",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 4,
      "mall_id": 5,
      "company_id": 3,
      "category_id": 9,
      "name": "Miniso Kenya",
      "floor": "0",
      "phone_numbers": ["+254743277231"],
      "email": "ying.wang@miniso.com",
      "hours": {
        "fri": "10:00AM-8:00PM",
        "mon": "10:00AM-8:00PM",
        "sat": "10:00AM-8:00PM",
        "sun": "10:00AM-8:00PM",
        "thu": "10:00AM-8:00PM",
        "tue": "10:00AM-8:00PM",
        "wed": "10:00AM-8:00PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fminiso-logo.jpg?alt=media&token=c8e16b08-a490-4b41-a313-b8503de27cb5",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 5,
      "mall_id": 4,
      "company_id": 4,
      "category_id": 7,
      "name": "Manix Clothing",
      "floor": "1",
      "storeModelName": "Curve227",
      "phone_numbers": ["+254733897459"],
      "email": "info@manix.co.ke",
      "hours": {
        "fri": "10:00AM-7:30PM",
        "mon": "10:00AM-7:30PM",
        "sat": "10:00AM-7:30PM",
        "sun": "10:00AM-7:30PM",
        "thu": "10:00AM-7:30PM",
        "tue": "10:00AM-7:30PM",
        "wed": "10:00AM-7:30PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fmanix-logo.jpg?alt=media&token=c33c0ab6-903d-4948-b44a-3471b6b6309f",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 6,
      "mall_id": 6,
      "company_id": 6,
      "category_id": 5,
      "name": "Galito's",
      "floor": "0",
      "phone_numbers": ["+254700323323"],
      "email": "customercare@ke-simbisa.com",
      "hours": {
        "fri": "9:00AM-9:00PM",
        "mon": "9:00AM-9:00PM",
        "sat": "9:00AM-9:00PM",
        "sun": "9:00AM-9:00PM",
        "thu": "9:00AM-9:00PM",
        "tue": "9:00AM-9:00PM",
        "wed": "9:00AM-9:00PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fgalitos-logo.jpg?alt=media&token=09b42d07-9fcd-4b7b-a209-1dbc70bb4c5f",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 7,
      "mall_id": 4,
      "company_id": 7,
      "category_id": 7,
      "name": "Mr Price",
      "floor": "1",
      "storeModelName": "Curve266",
      "phone_numbers": ["+254777666680"],
      "email": null,
      "hours": {
        "fri": "10:00AM-7:00PM",
        "mon": "10:00AM-7:00PM",
        "sat": "10:00AM-7:00PM",
        "sun": "10:00AM-7:00PM",
        "thu": "10:00AM-7:00PM",
        "tue": "10:00AM-7:00PM",
        "wed": "10:00AM-7:00PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fmrp-logo.jpg?alt=media&token=2b4491b3-e109-4750-a62e-065e967d6cdc",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 8,
      "mall_id": 6,
      "company_id": 9,
      "category_id": 10,
      "name": "Textbook Center",
      "floor": "0",
      "phone_numbers": ["+254730735168", "+254730735156"],
      "email": "tworivers@tbc.co.ke",
      "hours": {
        "fri": "8:30AM-7:00PM",
        "mon": "8:30AM-7:00PM",
        "sat": "8:30AM-7:00PM",
        "sun": "8:30AM-7:00PM",
        "thu": "8:30AM-7:00PM",
        "tue": "8:30AM-7:00PM",
        "wed": "8:30AM-7:00PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Ftbc-logo.jpg?alt=media&token=dd784d46-e82e-4fff-b3f3-f7c410ed901c",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 9,
      "mall_id": 4,
      "company_id": 9,
      "category_id": 10,
      "name": "Textbook Center",
      "floor": "0",
      "storeModelName": "Curve174",
      "phone_numbers": ["+254730735160", "+254730735159"],
      "email": "flagship@tbc.co.ke",
      "hours": {
        "fri": "8:30AM-7:30PM",
        "mon": "8:30AM-7:30PM",
        "sat": "8:30AM-7:30PM",
        "sun": "8:30AM-7:30PM",
        "thu": "8:30AM-7:30PM",
        "tue": "8:30AM-7:30PM",
        "wed": "8:30AM-7:30PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Ftbc-logo.jpg?alt=media&token=dd784d46-e82e-4fff-b3f3-f7c410ed901c",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 10,
      "mall_id": 5,
      "company_id": 9,
      "category_id": 10,
      "floor": "0",
      "name": "Textbook Center",
      "phone_numbers": ["+254730735153"],
      "email": "thehub@tbc.co.ke",
      "hours": {
        "fri": "8:30AM-7:30PM",
        "mon": "8:30AM-7:30PM",
        "sat": "8:30AM-7:30PM",
        "sun": "8:30AM-7:30PM",
        "thu": "8:30AM-7:30PM",
        "tue": "8:30AM-7:30PM",
        "wed": "8:30AM-7:30PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Ftbc-logo.jpg?alt=media&token=dd784d46-e82e-4fff-b3f3-f7c410ed901c",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 11,
      "mall_id": 6,
      "company_id": 8,
      "category_id": 8,
      "name": "Nike",
      "floor": "0",
      "phone_numbers": ["+254112922313"],
      "email": null,
      "hours": {
        "fri": "9:30AM-7:30PM",
        "mon": "9:30AM-7:30PM",
        "sat": "9:30AM-7:30PM",
        "sun": "9:30AM-7:30PM",
        "thu": "9:30AM-7:30PM",
        "tue": "9:30AM-7:30PM",
        "wed": "9:30AM-7:30PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fnike-logo.jpg?alt=media&token=3c14d2a1-3f18-421c-8d56-50c575324848",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 12,
      "mall_id": 4,
      "company_id": 11,
      "category_id": 7,
      "name": "Woolworths",
      "floor": "1",
      "storeModelName": "Curve232",
      "phone_numbers": [
        "+254719615140",
        "+254204343602",
        "+254204343603",
        "+254717181209"
      ],
      "email": "StoreAdministratorSaritCentreNairobi@woolworths.co.za",
      "hours": {
        "fri": "10:00AM-7:00PM",
        "mon": "10:00AM-7:00PM",
        "sat": "10:00AM-7:00PM",
        "sun": "10:00AM-7:00PM",
        "thu": "10:00AM-7:00PM",
        "tue": "10:00AM-7:00PM",
        "wed": "10:00AM-7:00PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fwoolworths-logo.jpg?alt=media&token=df4d6548-e00b-428d-a2c2-b34023095d60",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 13,
      "mall_id": 5,
      "company_id": 5,
      "category_id": 7,
      "name": "Levi's",
      "floor": "0",
      "phone_numbers": ["+254742961321"],
      "email": null,
      "hours": {
        "fri": "10:00AM-7:30PM",
        "mon": "10:00AM-7:30PM",
        "sat": "10:00AM-7:30PM",
        "sun": "10:00AM-7:30PM",
        "thu": "10:00AM-7:30PM",
        "tue": "10:00AM-7:30PM",
        "wed": "10:00AM-7:30PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Flevis-logo.jpg?alt=media&token=2c7b5048-8c8d-41db-95dc-f487dd573075",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 14,
      "mall_id": 3,
      "company_id": 10,
      "category_id": 7,
      "name": "Woolworths",
      "floor": "0",
      "phone_numbers": ["+254719615134"],
      "email": "StoreAdministratorYayaNairobi@woolworths.co.za",
      "hours": {
        "fri": "9:30AM-7:00PM",
        "mon": "9:30AM-7:00PM",
        "sat": "9:30AM-7:00PM",
        "sun": "9:30AM-7:00PM",
        "thu": "9:30AM-7:00PM",
        "tue": "9:30AM-7:00PM",
        "wed": "9:30AM-7:00PM"
      },
      "model_mapping_uuid": null,
      "logo_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/logos%2Fwoolworths-logo.jpg?alt=media&token=df4d6548-e00b-428d-a2c2-b34023095d60",
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    }
  ];

  static final adverts = [
    {
      "id": 1,
      "company_id": 1,
      "campaign_id": 1,
      "type": "square",
      "impressions": 0,
      "hyperlink": "https://bigsquare.co.ke",
      "alt_text": "a simple AD that opens a webpage",
      "priority": 10,
      "asset_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-big-square.jpeg?alt=media&token=f4b80468-36c5-4c23-b204-36591291e5ab",
      "min_duration_seconds": 6,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 1,
      "company_id": 1,
      "campaign_id": 1,
      "type": "square",
      "impressions": 0,
      "hyperlink": "https://example.com",
      "alt_text": "a simple AD that opens a webpage",
      "priority": 10,
      "asset_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-fashion-shop.jpeg?alt=media&token=843767b6-8552-4f25-bb97-bbca575e1eac",
      "min_duration_seconds": 6,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 1,
      "company_id": 1,
      "campaign_id": 1,
      "type": "square",
      "impressions": 0,
      "hyperlink": "https://example.com",
      "alt_text": "a simple AD that opens a webpage",
      "priority": 10,
      "asset_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-fashion-shop02.jpeg?alt=media&token=0a091138-c562-4f6c-a716-f44920a20510",
      "min_duration_seconds": 6,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 1,
      "company_id": 1,
      "campaign_id": 1,
      "type": "square",
      "impressions": 0,
      "hyperlink": "https://example.com",
      "alt_text": "a simple AD that opens a webpage",
      "priority": 10,
      "asset_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-supermarket.jpeg?alt=media&token=dce00ea7-bb5a-4531-abe3-c90270bc4049",
      "min_duration_seconds": 6,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 1,
      "company_id": 1,
      "campaign_id": 1,
      "type": "banner",
      "impressions": 0,
      "hyperlink": "https://kfc.ke",
      "alt_text": "a simple AD that opens a webpage",
      "priority": 10,
      "asset_url":
          "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/adverts%2Fad-kfc.jpeg?alt=media&token=fc6228ea-c5d1-49ed-bf37-9f44ca1113f8",
      "min_duration_seconds": 6,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
  ];

  static final categories = [
    {
      "id": 1,
      "name": "Uncategorized",
      "description": "No category has been assigned",
      "parent_id": null,
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 2,
      "name": "Restaurant",
      "description":
          "A business that serves food or drinks. Can be sit in or take out",
      "parent_id": null,
      "subcategories": [
        {
          "id": 3,
          "name": "Cafe",
          "description":
              "A restaurant that serves light snacks, pastries in addition to hot drinks e.g. coffee ",
          "parent_id": 2,
          "image_url":
              "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/featured%2Fcafe.jpg?alt=media&token=e0458b7a-650e-4c8a-991f-3597236dc52b",
          "created_at": "2023-04-15T18:50:43.000Z",
          "updated_at": "2023-04-15T18:50:43.000Z"
        },
        {
          "id": 5,
          "name": "Fast Food",
          "description":
              "A restaurant that offers quick service and food mainly for takeaways",
          "parent_id": 2,
          "image_url":
              "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/featured%2Ffast-food.jpg?alt=media&token=449a0081-c21e-43f9-9f1d-0c5c42574048",
          "created_at": "2023-04-15T18:50:43.000Z",
          "updated_at": "2023-04-15T18:50:43.000Z"
        },
      ],
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 4,
      "name": "Retail",
      "description":
          "A store that sells merchandise in small quantities directly to customers",
      "parent_id": null,
      "subcategories": [
        {
          "id": 9,
          "name": "Assorted",
          "description":
              "Sells merchandise from different brands and of different types",
          "parent_id": 4,
          "image_url":
              "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/featured%2Fassorted.jpg?alt=media&token=5f0fe697-b5b4-4b60-8f9d-ad3f9407049b",
          "created_at": "2023-04-15T18:50:43.000Z",
          "updated_at": "2023-04-15T18:50:43.000Z"
        },
        {
          "id": 10,
          "name": "Stationery",
          "description": "Sells office or school supplies",
          "parent_id": 4,
          "image_url":
              "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/featured%2Fstationery.jpg?alt=media&token=73cac5d0-9006-41bc-9761-8c7dcab1b3ee",
          "created_at": "2023-04-15T18:50:43.000Z",
          "updated_at": "2023-04-15T18:50:43.000Z"
        }
      ],
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
    {
      "id": 6,
      "name": "Fashion",
      "description": "A store that deals with cosmetics and appearance",
      "parent_id": null,
      "subcategories": [
        {
          "id": 7,
          "name": "Casualwear",
          "description":
              "Sells clothing that fits in casual environments as well as a few semi-formal settings",
          "parent_id": 6,
          "image_url":
              "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/featured%2Fcasual-wear.jpg?alt=media&token=91bd50ab-bb00-45e4-a763-468f1ec54a93",
          "created_at": "2023-04-15T18:50:43.000Z",
          "updated_at": "2023-04-15T18:50:43.000Z"
        },
        {
          "id": 8,
          "name": "Sportswear",
          "description":
              "Sells clothing majorly for sports activities but can include casualwear",
          "parent_id": 6,
          "image_url":
              "https://firebasestorage.googleapis.com/v0/b/wayo-254.appspot.com/o/featured%2Fsports-wear.jpg?alt=media&token=af71d8d0-de4a-498b-9134-5a131fd59524",
          "created_at": "2023-04-15T18:50:43.000Z",
          "updated_at": "2023-04-15T18:50:43.000Z"
        },
      ],
      "created_at": "2023-04-15T18:50:43.000Z",
      "updated_at": "2023-04-15T18:50:43.000Z"
    },
  ];

  static const policies =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer risus lectus, vulputate at tellus non, sagittis finibus est. Integer eget vehicula velit. Aliquam hendrerit a purus at tincidunt. Donec consectetur enim nisi, sit amet congue metus cursus et. Suspendisse quis mi dui. Cras nec convallis odio, ut tincidunt ante. Nullam pulvinar felis nunc, vitae tincidunt elit varius a. Duis vitae semper enim. Pellentesque et pellentesque eros, non fringilla velit. In sapien purus, tristique quis turpis sed, vulputate sollicitudin ex.\n\nStart Of New Paragraph\nMaecenas iaculis nunc nec quam vehicula, ac faucibus purus ultricies. Nulla ut arcu erat. Cras faucibus, tortor at semper venenatis, velit sapien tincidunt dui, non porttitor libero quam vitae diam. Nulla facilisi. Fusce augue libero, tempus id eros in, molestie venenatis ex. Praesent eget sem quis lorem tincidunt tincidunt. Nullam in metus a augue convallis blandit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ornare felis a purus placerat euismod. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut a dui tortor.\n\nStart Of New Paragraph\nProin sed velit maximus, posuere lacus in, tincidunt ex. Duis pulvinar neque est, quis porttitor sapien malesuada quis. Cras rhoncus dolor hendrerit felis maximus ornare. Ut a volutpat erat. Aenean in neque quam. Morbi egestas erat in odio laoreet, ultricies laoreet nibh sollicitudin. Suspendisse interdum est ac dapibus molestie. Phasellus non lacus faucibus, placerat tellus sit amet, porta augue. Pellentesque a placerat velit.\n\nStart Of New Paragraph\nDonec et hendrerit mi. Etiam accumsan nulla non mauris malesuada, ut sodales nunc elementum. Nam mollis suscipit dolor, id pretium ligula lobortis vitae. Vestibulum tincidunt urna massa, ut ornare est molestie eu. Vestibulum cursus at odio non sagittis. Vivamus sed eros accumsan, rhoncus erat eu, varius eros. Pellentesque dictum ligula id vulputate auctor. Morbi ullamcorper, nunc sed viverra iaculis, nulla sapien viverra purus, eu feugiat diam lectus laoreet velit.\n\nStart Of New Paragraph\nQuisque semper dolor vel velit facilisis dictum. Fusce sit amet lectus a diam tempor sagittis vel sit amet lectus. Nullam vulputate erat at ultricies laoreet. Integer gravida libero ac augue fermentum, in pretium lacus pellentesque. Aenean nec scelerisque dolor, a hendrerit metus. Phasellus metus nisi, rhoncus ac enim a, sodales efficitur ex. Donec nisi tellus, tincidunt quis convallis in, elementum nec erat. Phasellus vel neque a est mollis pellentesque ut consectetur libero. In nunc felis, laoreet ac eros non, ultricies fermentum elit. Suspendisse potenti. Sed vel tellus cursus, scelerisque quam ut, posuere elit. Fusce semper congue tempor. Suspendisse sed nunc eget turpis blandit mattis. Nullam elementum volutpat condimentum.\n\nStart Of New Paragraph\nCurabitur hendrerit orci id massa euismod, a egestas enim lacinia. Aenean gravida dapibus placerat. Sed accumsan sem non lectus consequat iaculis. Pellentesque nisl orci, aliquam quis neque at, dignissim consequat tortor. Donec non libero magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin consectetur, ipsum gravida ultricies tristique, justo ipsum imperdiet lacus, id lacinia dui lorem in ligula. Nam auctor iaculis urna, vel pharetra nunc ultricies eu. Morbi sed augue id turpis luctus laoreet et id dui. Quisque fermentum ante eget commodo porta. Integer pellentesque ligula vitae scelerisque aliquet. Maecenas scelerisque neque vel ultricies rhoncus. Mauris convallis id arcu nec mollis. Donec sed gravida magna, at suscipit justo. Maecenas interdum congue rhoncus. Integer interdum vitae neque vel interdum.\n\nStart Of New Paragraph\nAliquam sit amet tincidunt purus. In in diam quis eros convallis ornare et id odio. Duis rutrum tortor in diam finibus convallis vel ut lorem. Cras vel massa ultrices, sodales orci vulputate, euismod dui. Praesent id justo cursus, gravida metus quis, semper urna. Nullam ut nisi sit amet velit gravida volutpat dignissim et diam. Quisque eu faucibus nibh. Curabitur pellentesque velit at tristique porttitor. Proin facilisis pretium orci a aliquet. Aenean est nisl, accumsan vitae nisl a, lobortis luctus lectus. Morbi nec ex euismod, mattis leo nec, dignissim velit.\n\nStart Of New Paragraph\nMorbi nisi tellus, luctus nec commodo tempus, condimentum quis felis. Proin vehicula sit amet nibh vitae gravida. Donec lectus libero, molestie in efficitur sed, interdum eu felis. Nunc sit amet tempor dolor. Ut euismod ornare nisl, sed gravida elit dignissim congue. Curabitur venenatis porttitor nulla, nec porta nibh ultrices a. Nullam vel condimentum enim. Ut eget turpis elit. Nulla faucibus porta augue, eget euismod justo lobortis eget. Maecenas ut ullamcorper ante, sit amet tristique lacus. Proin efficitur purus quis dolor semper, ac mollis metus interdum. Suspendisse potenti. Quisque auctor, urna ut fringilla varius, purus quam gravida nulla, vitae pellentesque dolor turpis commodo libero.\n\nStart Of New Paragraph\nDonec tortor felis, venenatis mollis nulla sed, feugiat volutpat turpis. Nam pellentesque libero et dictum condimentum. Morbi varius eros quis arcu sollicitudin, at tincidunt lorem venenatis. Quisque porta metus elementum tortor ultricies pharetra. Sed eget turpis commodo, egestas metus in, cursus mauris. Morbi a ullamcorper dolor. Integer non dapibus ipsum. Phasellus pulvinar suscipit neque, sit amet elementum nulla pellentesque nec. Donec nec lacus finibus purus luctus consequat vel sit amet enim. Aenean sed elementum est.\n\nStart Of New Paragraph\nProin leo metus, efficitur quis augue convallis, sollicitudin porttitor erat. Etiam eget urna non lectus ornare semper quis nec dui. Nam lacinia consectetur leo sit amet tempus. Quisque sit amet maximus nulla, non egestas dui. In sapien lorem, placerat a mattis ut, scelerisque et enim. Aliquam non tortor fermentum lectus facilisis ullamcorper sodales non lectus. Vivamus vel pulvinar ante. Etiam tempor nibh eget luctus gravida. Phasellus vel justo augue. Nam ultrices fringilla neque quis sagittis.";
}
