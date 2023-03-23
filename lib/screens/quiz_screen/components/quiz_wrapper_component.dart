import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hangingword/hangingword.dart';
import 'package:jangalma/widgets/topbar_widget.dart';
import 'package:readandrespond/readandrespond.dart';
import 'package:tapmatchingpairs/tapmatchingpairs.dart';
import 'package:writetranslation/writetranslation.dart';
import 'package:selecttranslation/selecttranslation.dart';
import 'package:translatethissentence/translatethissentence.dart';
import 'package:completethesentence/completethesentence.dart';
import 'package:completetheword/completetheword.dart';

import 'package:jangalma/screens/quiz_screen/viewmodels/quiz_viewmodel.dart';
import 'package:jangalma/widgets/progressivebar_widget.dart';
import 'package:jangalma/widgets/override_back_button_wrapper_widget.dart';

class QuizWrapperComponent extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(quizViewModelProvider);
    final questionIndex = useState(0);
    final progressionIndex = useState(0);

    Widget questionWidget = const Center(
      child: Text("NO QUESTION AVAILABLE")
    );

    void setQuestionResult(bool value){
      viewModel.questions[questionIndex.value]["result"] = value;
    }

    bool isNotLastQuestion(){
      return questionIndex.value < viewModel.questions.length - 1;
    }

    void progressionHandler(){
      if(progressionIndex.value < viewModel.questions.length){
        progressionIndex.value++;
      }
    }

    void nextQuestion(){
      progressionHandler();
      isNotLastQuestion()
        ? questionIndex.value++
        : Navigator.pushNamed(context, '/ranking');
    }

    useEffect(() {}, [viewModel.questions]);

    if(viewModel.questions.isNotEmpty){
      switch (viewModel.questions[questionIndex.value]['type']) {
        case 'tapmatchingpairs':
          questionWidget = TapMatchingPairs(
            id: viewModel.questions[questionIndex.value]["id"],
            titleButton: 'NEXT',
            pairs: viewModel.questions[questionIndex.value]["pairs"],
            difficulty: viewModel.questions[questionIndex.value]["difficulty"],
            feedbackMessage: viewModel.getFeedback(),
            setQuestionResult: setQuestionResult,
            action: () => nextQuestion(),
          );
          break;
        case 'translatethissentence':
          questionWidget = TranslateThisSentence(
            titleButton: 'NEXT',
            sentences: viewModel.questions[questionIndex.value]["sentences"],
            feedbackMessage: viewModel.getFeedback(),
            setQuestionResult: setQuestionResult,
            action: () => nextQuestion(),
          );
          break;
        case 'hangingword':
          questionWidget = HangingWord(
            titleButton: 'VALIDATE',
            titleButtonSheet: isNotLastQuestion() ? 'NEXT' : 'SEE RESULT',
            withImage: viewModel.questions[questionIndex.value]["image"],
            theWordWeWantToGuess: viewModel.questions[questionIndex.value]["answer"],
            answerTranslation: viewModel.questions[questionIndex.value]["answerTranslation"],
            setQuestionResult: setQuestionResult,
            action: () => nextQuestion(),
          );
          break;
        case 'selecttranslation':
          questionWidget = SelectTranslation(
            id: viewModel.questions[questionIndex.value]["id"],
            title: viewModel.questions[questionIndex.value]["title"],
            titleButton: 'VALIDATE',
            titleButtonSheet: isNotLastQuestion() ? 'NEXT' : 'SEE RESULT',
            options: viewModel.questions[questionIndex.value]["options"],
            answer: viewModel.questions[questionIndex.value]["answer"],
            setQuestionResult: setQuestionResult,
            action: () => nextQuestion(),
          );
          break;
        case 'writetranslation':
          questionWidget = WriteTranslation(
            id: viewModel.questions[questionIndex.value]["id"],
            title: viewModel.questions[questionIndex.value]["title"],
            titleButton: 'VALIDATE',
            titleButtonSheet: isNotLastQuestion() ? 'NEXT' : 'SEE RESULT',
            answer: viewModel.questions[questionIndex.value]["answer"],
            setQuestionResult: setQuestionResult,
            action: () => nextQuestion(),
          );
          break;
        case 'readandrespond':
          questionWidget = ReadAndRespond(
            id: viewModel.questions[questionIndex.value]["id"],
            title: viewModel.questions[questionIndex.value]["title"],
            titleButton: 'VALIDATE',
            text: viewModel.questions[questionIndex.value]["text"],
            titleButtonSheet: isNotLastQuestion() ? 'NEXT' : 'SEE RESULT',
            questionText: viewModel.questions[questionIndex.value]["question"],
            options: viewModel.questions[questionIndex.value]["options"],
            answer: viewModel.questions[questionIndex.value]["answer"],
            setQuestionResult: setQuestionResult,
            action: () => nextQuestion(),
          );
          break;
        case 'completethesentence':
          questionWidget = CompleteTheSentence(
            title: viewModel.questions[questionIndex.value]["title"],
            titleButton: 'VALIDATE',
            titleButtonSheet: isNotLastQuestion() ? 'NEXT' : 'SEE RESULT',
            answer: viewModel.questions[questionIndex.value]["answer"],
            answerTranslated: viewModel.questions[questionIndex.value]["answerTranslated"],
            wordsToSelectAnswer: viewModel.questions[questionIndex.value]["wordsToSelectAnswer"],
            selectableWords: viewModel.questions[questionIndex.value]["selectableWords"],
            setQuestionResult: setQuestionResult,
            action: () => nextQuestion(),
            withImage: viewModel.questions[questionIndex.value]["image"],
            isSentenceAQuestion: viewModel.questions[questionIndex.value]["answer"].contains('?'),
          );
          break;
        case 'completetheword':
          questionWidget = CompleteTheWord(
            title: viewModel.questions[questionIndex.value]["title"],
            titleButton: 'VALIDATE',
            titleButtonSheet: isNotLastQuestion() ? 'NEXT' : 'SEE RESULT',
            answer: viewModel.questions[questionIndex.value]["answer"],
            answerTranslated: viewModel.questions[questionIndex.value]["answerTranslated"],
            wordsToSelectAnswer: viewModel.questions[questionIndex.value]["wordsToSelectAnswer"],
            selectableWords: viewModel.questions[questionIndex.value]["selectableWords"],
            setQuestionResult: setQuestionResult,
            action: () => nextQuestion(),
            withImage: viewModel.questions[questionIndex.value]["image"],
            isSentenceAQuestion: viewModel.questions[questionIndex.value]["answer"].contains('?'),
          );
          break;
        default:
          questionWidget = const Center(
            child: Text("THIS TYPE OF QUESTION DOESNT EXIST")
          );
          break;
      }
    }

    return OverrideBackButtonWrapperWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: viewModel.questions.isNotEmpty ?
          Column(          
            children: [
              TopBarWidget(
                defaultStyle: false,
                widget: ProgressionBar(
                  maxSteps: viewModel.questions.length,
                  currentStep: viewModel.questions.length > progressionIndex.value
                    ? progressionIndex.value
                    : viewModel.questions.length
                ),
              ),              
              questionWidget
            ],
          )
        : questionWidget
      ),
    );
  }
}
