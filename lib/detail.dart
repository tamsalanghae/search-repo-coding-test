import 'package:flutter/material.dart';
class RepoDetail extends StatefulWidget {
  final Map data;
  const RepoDetail(this.data);
  @override
  _RepoDetailState createState() {
    return _RepoDetailState();
  }
}

class _RepoDetailState extends State<RepoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Center(child: Text(widget.data['full_name'], style: TextStyle(fontWeight: FontWeight.w600),)),),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            CircleAvatar(backgroundImage: NetworkImage(widget.data['owner']['avatar_url']), minRadius:100, maxRadius: 120,),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text(widget.data['full_name'], style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0),
                      child: Container(
                        child:  Text("Written in ${widget.data['language']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${widget.data['stargazers_count']} stars", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      Text("Fork: ${widget.data['forks_count']}", style: TextStyle(fontSize: 16,  fontWeight: FontWeight.w500),),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      Text("${widget.data['watchers_count']} watchers", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      Text("${widget.data['open_issues_count']} issues", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
