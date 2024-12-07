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
        QuerySnapshot querySnapshot =
            await FirebaseFirestore.instance.collection('quies').get();
        List<String> docids = querySnapshot.docs.map((doc) => doc.id).toList();
        // int random = Random().nextInt(docids.length);
        // String startid = docids[random];
        // List<String> usedids = [];
        // usedids.add(startid);
        // CollectionReference cd = FirebaseFirestore.instance.collection("quies");
        // DocumentSnapshot ds = await cd.doc(startid).get();
        // Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
        emit(BlocLoaded(docids));
      } catch (e) {
        emit(BlocError(e.toString()));
      }
    });
  }
}
