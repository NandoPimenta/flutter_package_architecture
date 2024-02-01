class ErrorModel {
  String title;
  String message;
  String code;

  ErrorModel({ this.title ="" ,this.message = "", this.code = ""});


 static ErrorModel unknownError(){
    return ErrorModel(
      title: "Error",
      code: "0001",
      message: "Erro desconhecido, se o erro persistir entre em contato com o suporte!"
    );
  }

}