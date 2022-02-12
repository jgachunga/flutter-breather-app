import 'package:flutter_demo_app/breath_list/models/breath_history_model.dart';
import 'package:flutter_demo_app/breath_list/repo/breath_service.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:flutter_demo_app/core/enums/session_state.dart';
import 'package:flutter_demo_app/helpers/breath_session_state_updater.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'breath_view_model_test.mocks.dart';

@GenerateMocks([BreathService, BreathSessionStateUpdater], customMocks: [
MockSpec<BreathService>(as: #MockBreathServiceForTest, returnNullOnMissingStub: true),
])
void main() {
  final createdAt = DateTime.now();
  final tBreathHistoryModel = BreatheHistory(
      id: 1,
      elapsedSeconds: 47,
      elapsedMinutes: 2,
      intervals: 3,
      createdAt: createdAt);

  late MockBreathService mockBreathService;
  late MockBreathSessionStateUpdater mockBreathSessionStateUpdater;

  setUp(() {
    mockBreathService = MockBreathService();
    mockBreathSessionStateUpdater = MockBreathSessionStateUpdater();
  });
  group('BreathViewmodelTest -', (){
    group('Initial values when constructed -', () {

      test('When constructed loading should be false', () {
        var model = BreathHistoryViewModel(breathService: mockBreathService,
            breathSessionStateUpdater: mockBreathSessionStateUpdater);
        expect(model.loading, false);
      });
      test('When constructed breath list should be empty', () {
        var model = BreathHistoryViewModel(breathService: mockBreathService,
            breathSessionStateUpdater: mockBreathSessionStateUpdater);
        expect(model.breathHistoryModelList, []);
      });

    });

    group('BreathViewModelFunctions -', () {

      test('should call set loading when loading', () {
        var model = BreathHistoryViewModel(breathService: mockBreathService,
            breathSessionStateUpdater: mockBreathSessionStateUpdater);
        model.setLoading(true);
        //act
        model.setLoading(false);
        //assert
        expect(model.loading, false);
      });
      test('Should update breath list with new values', () {
        var model = BreathHistoryViewModel(breathService: mockBreathService,
            breathSessionStateUpdater: mockBreathSessionStateUpdater);
        //act
        model.setBreathHistoryListModel([]);
        //assert
        expect(model.breathHistoryModelList, []);
      });
      test('Should set selected breathing session with value', () {
        var model = BreathHistoryViewModel(breathService: mockBreathService,
            breathSessionStateUpdater: mockBreathSessionStateUpdater);
        //act
        model.setSelectedSession(tBreathHistoryModel);
        //assert
        expect(model.selectedBreathSession, tBreathHistoryModel);
      });

      test('Should call breath service get all breath history when getBreathingHistory() is called', () {
        var model = BreathHistoryViewModel(breathService: mockBreathService,
            breathSessionStateUpdater: mockBreathSessionStateUpdater);
        when(mockBreathService.list()).thenAnswer((_) async => []
        );
        //act
        model.getBreathingHistory();
        //assert
        verify(mockBreathService.list());
      });

    });
    group('Update Session States', () {
      SessionState state = SessionState.Initial;
      SessionState nextState = SessionState.Starting;
      String displayText = "Get Ready";

        test('calls next function when nextState is called on breath view model and returns correct next state', () {
          //arrange
          var model = BreathHistoryViewModel(breathService: mockBreathService,
              breathSessionStateUpdater: mockBreathSessionStateUpdater);
          when(mockBreathSessionStateUpdater.nextState(state)).thenAnswer((_) => nextState);
          when(mockBreathSessionStateUpdater.getDisplayText(state)).thenAnswer((_) => displayText);
          //act
          var result = model.nextState(state);
          //assert
          verify(mockBreathSessionStateUpdater.nextState(state));
          verify(mockBreathSessionStateUpdater.getDisplayText(state));
          expect(result, nextState);
        });

      test('calls function getInstructionText when nextState is called on breath view model and returns correct instruction text', () {
        //arrange
        var text = "Start";
        var model = BreathHistoryViewModel(breathService: mockBreathService,
            breathSessionStateUpdater: mockBreathSessionStateUpdater);

        when(mockBreathSessionStateUpdater.getInstructionText(state)).thenAnswer((_) => text);
        //act
        var result = model.instructionText(state);
        //assert
        verify(mockBreathSessionStateUpdater.getInstructionText(state));
        expect(result, text);
      });
      test('calls function getInstructionText when nextState is called on breath view model and returns correct instruction text', () {
        //arrange
        var text = "Start";
        var model = BreathHistoryViewModel(breathService: mockBreathService,
            breathSessionStateUpdater: mockBreathSessionStateUpdater);

        when(mockBreathSessionStateUpdater.getInstructionText(state)).thenAnswer((_) => text);
        //act
        var result = model.instructionText(state);
        //assert
        verify(mockBreathSessionStateUpdater.getInstructionText(state));
        expect(result, text);
      });

    });
  });
}
