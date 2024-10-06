import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {  @override
  State<StatefulWidget> createState() =>_ThirdPageState();
}
class _ThirdPageState extends State<ThirdPage> {
  var selectedRadio1='Product sans(default)';
  var selectedRadio2='Always';
  var selectedRadio3='Private';
  List <bool>isswitched=List.generate(9,(index)=>false);
   @override
  Widget build(BuildContext context) {
  return Scaffold(
    body:
    Column(
      children: [
        SizedBox(width: 30,height: 30,),
        Row(
          children: [
            CircleAvatar(
              backgroundColor:Colors.green,
              radius: 50,
              child: Icon(Icons.person,size: 80,),
            ),
            SizedBox(width: 40),
            Text('Welcome Misbah',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 28),),

          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                    leading:Icon(Icons.font_download),
                    title: Text('Title and comment font'),
                    subtitle: Text('$selectedRadio1'),
                    onTap:(){showDialog(
                        context:context,
                        builder:(BuildContext context){return
                          SimpleDialog(
                              title: Text('Title and comment font'),
                              children: [
                                RadioListTile(title:
                                Text('Product sans (default)'),
                                    value:'Product sans (default)' ,
                                    groupValue: selectedRadio1,
                                    onChanged: (value){
                                      setState(() {
                                        selectedRadio1=value!;
                                        Navigator.of(context).pop();
                                      });
          
                                    }
                                ),
                                RadioListTile(title:
                                Text('Device default'),
                                    value:'Device default' ,
                                    groupValue: selectedRadio1,
                                    onChanged: (value){
                                      setState(() {
                                        selectedRadio1=value!;
                                        Navigator.of(context).pop();
                                      });
          
                                    }
                                ),
                                RadioListTile(title:
                                Text('Verdana (sans serif)'),
                                    value:'Verdana (sans serif)' ,
                                    groupValue: selectedRadio1,
                                    onChanged: (value){
                                      setState(() {
                                        selectedRadio1=value!;
                                        Navigator.of(context).pop();
                                      });
          
                                    }
                                ),
                                RadioListTile(title:
                                Text('JetBrains Mono (monospace)'),
                                    value:'JetBrains Mono(monospace)' ,
                                    groupValue: selectedRadio1,
                                    onChanged: (value){
                                      setState(() {
                                        selectedRadio1=value!;
                                        Navigator.of(context).pop();
                                      });
          
                                    }
                                ),
                                RadioListTile(title:
                                Text('Georgia (serif)'),
                                    value:'Georgia (serif)' ,
                                    groupValue: selectedRadio1,
                                    onChanged: (value){
                                      setState(() {
                                        selectedRadio1=value!;
                                        Navigator.of(context).pop();
                                      });
          
                                    }
                                ),
                                RadioListTile(title:
                                Text('Roboto slab (serif)'),
                                    value:'Roboto slab (serif)' ,
                                    groupValue: selectedRadio1,
                                    onChanged: (value){
                                      setState(() {
                                        selectedRadio1=value!;
                                        Navigator.of(context).pop();
                                      });
          
                                    }
                                ),
                                Container(padding:EdgeInsets.only(left:200),
                                    child: TextButton(onPressed: (){Navigator.of(context).pop();},child: Text('Cancel')))
          
                              ] );
                        }
                    );
                    }
                ),


        ListTile(
          leading:Icon(Icons.message),
          title: Text('Allow story sharing in messages'),
          subtitle: Text(''),
          trailing: Switch.adaptive(
            value: isswitched[0],
            onChanged: (newvalue){setState(() {
              isswitched[0]=newvalue;
            });
            },
          ),
        ),
        ListTile(
          leading:Icon(Icons.comment),
          title: Text('Hide Comments'),
          subtitle: Text(''),
          trailing: Switch.adaptive(
            value: isswitched[1],
            onChanged: (newvalue){setState(() {
              isswitched[1]=newvalue;
            });
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.dark_mode),
          title:Text('Dark Mode'),
          trailing: Switch.adaptive(
              value: isswitched[2],
              onChanged: (newvalue){setState(() {
                isswitched[2]=newvalue;
              });
              }
              ),
        ),
        ListTile(
          leading: Icon(Icons.arrow_back_rounded),
          title: Text('Preload websites'),
          onTap: (){showDialog(
            context:context,
            builder: (BuildContext context){
              return SimpleDialog(
              title:Text('Preload websites'),
              children: [
                RadioListTile(
                  title: Text('Always'),
               value: "Always",
               groupValue: selectedRadio2,
                onChanged: (value){
                 setState(() {
                   selectedRadio2=value!;
                   Navigator.of(context).pop();

                 });
                 }),
                RadioListTile(
                  title: Text('Only On Wifi'),
                  value: "Only On Wifi",
                  groupValue:selectedRadio2,
                  onChanged:(value){
                    setState(() {
                      selectedRadio2=value!;
                      Navigator.of(context).pop();
                    });
                  }
                ),
                RadioListTile(
                  title:Text('Never'),
                  groupValue: selectedRadio2,
                  value:'Never',
                  onChanged: (value){
                    setState(() {
                      selectedRadio2=value!;
                      Navigator.of(context).pop();
                    });
                  },

                ),
                Container(padding:EdgeInsets.only(left:200),
                child: TextButton(onPressed: (){Navigator.of(context).pop();},child: Text('Cancel')))
              ],);
             }

          );}
        ),
        ListTile(
          title: Text('Background Refresh'),
          leading: Icon(Icons.refresh),
          trailing: Switch.adaptive(value:isswitched[3], onChanged: (newvalue){
            setState(() {
              isswitched[3]=newvalue;
            });
          }),
        ),
        ListTile(
          title: Text('Public/Private'),
          leading: Icon(Icons.public),
          onTap: (){showDialog(context: context,
              builder: (BuildContext context){
            return SimpleDialog(
              children: [
                RadioListTile(
                  title: Text('Private'),
                  groupValue:selectedRadio3,
                  value: "Private",
                  onChanged: (value){
                    setState(() {
                      selectedRadio3=value!;
                      Navigator.of(context).pop();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Public'),
                  groupValue:selectedRadio3,
                  value: "Public",
                  onChanged: (value){
                    setState(() {
                      selectedRadio3=value!;
                      Navigator.of(context).pop();
                    });
                  },
                ),
                Container(padding:EdgeInsets.only(left:200),
                    child: TextButton(onPressed: (){Navigator.of(context).pop();},child: Text('Cancel')))
              ],
            );
              });},
        ),
        ListTile(
          title: Text('Location'),
          leading: Icon(Icons.location_history),
          trailing: Switch.adaptive(value:isswitched[4], onChanged: (newvalue){
            setState(() {
              isswitched[4]=newvalue;
            });
          }),
        ),
        ListTile(
          title: Text('Show Online Status'),
          leading: Icon(Icons.circle,color: Colors.green),
          trailing: Switch.adaptive(value:isswitched[5], onChanged: (newvalue){
            setState(() {
              isswitched[5]=newvalue;
            });
          }),
        ),
        ListTile(
          title: Text('Show Reciepts'),
          leading: Icon(Icons.receipt),
          trailing: Switch.adaptive(value:isswitched[6], onChanged: (newvalue){
            setState(() {
              isswitched[6]=newvalue;
            });
          }),
        ),
        ListTile(
          title: Text('Show Reciepts'),
          leading: Icon(Icons.receipt),
          trailing: Switch.adaptive(value:isswitched[7], onChanged: (newvalue){
            setState(() {
              isswitched[7]=newvalue;
            });
          }),
        ),


])
          ))
      ],
    )
  );
  }
}
