// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';

// Project imports:
import 'package:suche_app/model/event.dart';
import 'package:suche_app/model/user.dart';
import 'package:suche_app/util/custom_colors.dart';
import 'package:suche_app/util/util.dart';

class EventTileComumComponent extends StatefulWidget {
  final Event event;
  final User user;

  const EventTileComumComponent(
      {Key? key, required this.event, required this.user})
      : super(key: key);

  @override
  _EventTileComumComponentState createState() => _EventTileComumComponentState();
}

class _EventTileComumComponentState extends State<EventTileComumComponent> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      padding: EdgeInsets.all(15.0),
      color: CustomColors.colorLightGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Nome do Evento
          Text(
            widget.event.name,
            style: TextStyle(
              color: CustomColors.orangePrimary.shade400,
              fontFamily: 'OpenSans',
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
            ),
          ),

          // Descrição do evento
          Text(
            widget.event.description,
            style: TextStyle(
                color: CustomColors.colorOrangeSecondary,
                fontFamily: 'OpenSans',
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 5.0),

          //Promotor do evento
          Row(children: <Widget>[
            Icon(
              Mdi.accountOutline,
              color: CustomColors.colorOrangeSecondary,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              widget.event.promoter == null
                  ? 'Não informado'
                  : widget.event.promoter!.name +
                      ' ' +
                      widget.event.promoter!.surname, // NULLABLE ??
              style: TextStyle(
                color: CustomColors.colorOrangeSecondary,
                fontFamily: 'OpenSans',
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ]),

          //Data do evento
          Row(
            children: <Widget>[
              Icon(
                Mdi.calendarStar,
                color: CustomColors.colorOrangeSecondary,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                DateFormat('dd/MM/yyyy – HH:mm')
                    .format(widget.event.date),
                style: TextStyle(
                  color: CustomColors.colorOrangeSecondary,
                  fontFamily: 'OpenSans',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          //Valor do evento
          Row(children: <Widget>[
            Icon(
              Mdi.cash,
              color: CustomColors.colorOrangeSecondary,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              Util.toMoney(widget.event.value),
              style: TextStyle(
                color: CustomColors.colorOrangeSecondary,
                fontFamily: 'OpenSans',
                fontSize: 15.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ]),

          //Local do evento (online/presencial)
          Visibility(
            visible: widget.event.localization != null,
            child: Row(children: <Widget>[
              Icon(
                Mdi.mapMarker,
                color: CustomColors.colorOrangeSecondary,
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Text(
                  widget.event.localization == null
                      ? 'Não informado'
                      : widget.event.localization!.street +
                          ', Nº ' +
                          widget.event.localization!.number
                              .toString() +
                          ' - ' +
                          widget.event.localization!
                              .city, // NULLABLE ??
                  style: TextStyle(
                    color: CustomColors.colorOrangeSecondary,
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]),
            replacement: Row(children: <Widget>[
              Icon(
                Mdi.link,
                color: CustomColors.colorOrangeSecondary,
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Text(
                  widget.event.link, // NULLABLE ??
                  style: TextStyle(
                    color: CustomColors.colorOrangeSecondary,
                    fontFamily: 'OpenSans',
                    fontSize: 15.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]),
          ),

          //Categoria do evento
          Row(children: <Widget>[
            Icon(
              Mdi.formatListChecks,
              color: CustomColors.colorOrangeSecondary,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              widget.event.category,
              style: TextStyle(
                color: CustomColors.colorOrangeSecondary,
                fontFamily: 'OpenSans',
                fontSize: 15.0,
              ),
            ),
          ]),

          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
