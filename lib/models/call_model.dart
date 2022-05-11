class CallModel {
  final String name;
  final String time;
  final String avatarUrl;
  final String status;

  CallModel(this.name, this.status, this.time, this.avatarUrl);
}

List<CallModel> dummyData = [
  CallModel("Taufik Hussain", "Outgoing", "5 May, 15:30",
      "https://i.picsum.photos/id/882/200/300.jpg?hmac=j02hkJZfREXyROkSfM6KpIIPHsAaGLmWylVEr5sRzok"),
  CallModel("Prince Aggarwal", "Incoming", "26 Apr, 17:30",
      "https://i.picsum.photos/id/882/200/300.jpg?hmac=j02hkJZfREXyROkSfM6KpIIPHsAaGLmWylVEr5sRzok"),
  CallModel("Nick Johns", "Incoming", "15/01/2021, 5:00",
      "https://i.picsum.photos/id/316/200/300.jpg?hmac=sq0VBO6H0wGg9Prod7MVUUB_7B91kmD5E1X1TRSo66U"),
  CallModel("Elon Mask", "Incoming", "10/05/2021, 10:30",
      "https://i.picsum.photos/id/948/200/300.jpg?hmac=P3pbS5OFe3xlh-_nxsMU3WRWDS5lXF_rBKQZIL_7wPo"),
  CallModel("Bill Gates", "Outgoing", "20/01/2020, 12:30",
      "https://i.picsum.photos/id/289/200/300.jpg?hmac=TVh4H_Hra3e1VSDPJz-mhCgep32qIa7T6DGQvbrjMb4"),
  CallModel("Nitin Chauhan", "Incoming", "15/01/2018, 15:30",
      "https://i.picsum.photos/id/657/200/300.jpg?hmac=EHK6W3Q_p0WAYArHzSre54j6vS3QLdqcMKvty45Bo40"),
  CallModel("Nitin Kumar", "Incoming", "15/01/2018, 15:30",
      "https://i.picsum.photos/id/316/200/300.jpg?hmac=sq0VBO6H0wGg9Prod7MVUUB_7B91kmD5E1X1TRSo66U"),
  CallModel("Data Singh", "Incoming", "15/01/2018, 15:30",
      "https://i.picsum.photos/id/861/200/300.jpg?hmac=kssNLkcAZTJQKpPCSrGodykV8A6CStZxL7dHvtsVUD0"),
  CallModel("Anil Singh", "Incoming", "15/01/2018, 15:30",
      "https://i.picsum.photos/id/948/200/300.jpg?hmac=P3pbS5OFe3xlh-_nxsMU3WRWDS5lXF_rBKQZIL_7wPo"),
  CallModel("Ranveer Singh", "Incoming", "15/01/2018, 15:30",
      "https://i.picsum.photos/id/369/200/300.jpg?hmac=ZM5SPtUsEjxc4HjsZXj3DAHeKWSaZV6r8sJMGiLYIJ8"),
  CallModel("Alia Bhutt", "Incoming", "15/01/2018, 15:30",
      "https://i.picsum.photos/id/948/200/300.jpg?hmac=P3pbS5OFe3xlh-_nxsMU3WRWDS5lXF_rBKQZIL_7wPo"),
];
