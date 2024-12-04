import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<FetchDocId>((event, emit) async {
      emit(BlocLoading());
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('your_collection_name')
            .get();
        List<String> docids = querySnapshot.docs.map((doc) => doc.id).toList();
        emit(BlocLoaded(docids));
      } catch (e) {
        emit(BlocError(e.toString()));
      }
    });
  }
}
