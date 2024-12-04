import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial());

  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is FetchDocId) {
      yield BlocLoading();
      try {
        final queaysnapshot =
            await FirebaseFirestore.instance.collection("quies").get();
        final docuids = queaysnapshot.docs.map((doc) => doc.id).toList();
        yield BlocLoaded(docuids);
      } catch (e) {
        BlocError(e.toString());
      }
    }
  }
}
