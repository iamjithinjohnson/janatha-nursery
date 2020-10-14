//

class Data {

  //jsonfile indoor plant
  static const jsonindoor = 'https://raw.githubusercontent.com/iamjithinjohnson/flutter/master/janathaApp/json/indoor.json';
//jsonfile outdoorplant
static const jsonoutdoor = 'https://raw.githubusercontent.com/iamjithinjohnson/flutter/master/janathaApp/json/outdoor.json';


  // janatha logo profile
  static const janathalogopro = 'https://lh3.googleusercontent.com/-ubLv_TOpPYY/X37EuqPyd7I/AAAAAAAAAio/L2I6dxeBgP8Qaxu4vGPlJcLhdbot4LrawCLcBGAsYHQ/image.png';
  //janatha logo url
  static const janathaLogo =
      'https://lh3.googleusercontent.com/-8jCLu2bvqrs/X4RTtE-FamI/AAAAAAAAAjI/pStsEjAOjj4X_LIgapXJSy_hevC4T1QEQCLcBGAsYHQ/logo.jpg';

//facebook logo url
  static const faceLogo =
      'https://1.bp.blogspot.com/-UOh431b-6NM/X4Ra576JTHI/AAAAAAAAAko/_plotq0EFiwe_SN0TDGzq9Ga0BKIbmY-QCLcBGAsYHQ/s0/facelog.png';

//instagram logo url
  static const instaLogo =
      'https://1.bp.blogspot.com/-AtVu1s3OHyM/X4Rd0TH4PQI/AAAAAAAAAlc/qO41laQHoUsKJflgJkWk16QA32_pnd1BQCLcBGAsYHQ/s0/instalog.png';

// youtube logo url
  static const youtubeLogo =
      'https://1.bp.blogspot.com/-MYYMMy1OhQk/X4RcV5kH17I/AAAAAAAAAk8/uruBsHV9frM_Ttw-agq2XVDp11idh64lACLcBGAsYHQ/s0/youlog.png';


// youtube link opening
  static const youtubeBro =
      'https://www.youtube.com/channel/UCMf_tD6BPUicsNu6z2cRhMg?view_as=subscriber';

// facebook link opening ( temperory )
  static const faceBro = 'https://www.facebook.com/';

// instagram link opening ( temperory )
  static const instaBro = 'https://www.instagram.com/';

  //janathaData, github json
  String imgpath, name, category, id ,info;
  int price;

  Data({
    this.id,
    this.imgpath,
    this.name,
    this.price,
    this.category,
    this.info,
  });
}

List <Data> janatha(){
  return <Data>[
      Data(
      id: '3',
      category: 'agriculture',
      name: 'lucky bamboo',
      price: 300,
      imgpath:
          'https://3.imimg.com/data3/KE/PR/MY-10774892/lucky-bamboo-tree-500x500.jpg',
    ),

  ];
}

//  Data(
//       id: '1',
//       category: 'indoor plants',
//       name: 'rose',
//       price: 200,
//       imgpath:
//           'https://dp5zphk8udxg9.cloudfront.net/wp-content/uploads/2017/10/shutterstock_612686159-e1508754792624.jpg',
//     ),
//     Data(
//       id: '2',
//       category: 'Outdoor plants ',
//       name: 'money plant ',
//       price: 300,
//       imgpath:
//           'https://images-na.ssl-images-amazon.com/images/I/41YlnnYriDL.jpg',
//     ),
//     Data(
//       id: '3',
//       category: 'agriculture',
//       name: 'lucky bamboo',
//       price: 300,
//       imgpath:
//           'https://3.imimg.com/data3/KE/PR/MY-10774892/lucky-bamboo-tree-500x500.jpg',
//     ),
//     Data(
//       id: '4',
//       category: 'flower',
//       name: 'jumbo plant',
//       price: 1300,
//       imgpath:
//           'https://i.pinimg.com/originals/23/68/67/236867f7cf4a63079b877fc44ade15b2.jpg',
//     ),
//   ];
