import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false; // Indica se a pergunta foi respondida
  int _selectedAnswerIndex = -1; // Índice da resposta selecionada

  final List<Map<String, Object>> _questions = [
    {
      'question': 'Qual é a capital da França?',
      'answers': [
        {'text': 'Paris', 'isCorrect': true},
        {'text': 'Londres', 'isCorrect': false},
        {'text': 'Berlim', 'isCorrect': false},
        {'text': 'Madri', 'isCorrect': false},
      ],
    },
    {
      'question': 'Quem pintou a Mona Lisa?',
      'answers': [
        {'text': 'Vincent van Gogh', 'isCorrect': false},
        {'text': 'Pablo Picasso', 'isCorrect': false},
        {'text': 'Leonardo da Vinci', 'isCorrect': true},
        {'text': 'Michelangelo', 'isCorrect': false},
      ],
    },
    // Mais perguntas podem ser adicionadas aqui
  ];

  void _answerQuestion(int index, bool isCorrect) {
    if (!_answered) {
      setState(() {
        _answered = true;
        _selectedAnswerIndex = index;
        if (isCorrect) {
          _score++;
        }
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _answered = false;
      _selectedAnswerIndex = -1; // Resetar seleção
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz estilo Kahoot'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? _buildQuizBody()
          : _buildResultScreen(),
    );
  }

  Widget _buildQuizBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _questions[_currentQuestionIndex]['question'] as String,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        ...(_questions[_currentQuestionIndex]['answers']
                as List<Map<String, Object>>)
            .asMap()
            .entries
            .map((entry) {
          int index = entry.key;
          Map<String, Object> answer = entry.value;
          return _buildAnswerButton(
              index, answer['text'] as String, answer['isCorrect'] as bool);
        }).toList(),
        const SizedBox(height: 20),
        if (_answered)
          ElevatedButton(
            onPressed: _nextQuestion,
            child: const Text('Próxima Pergunta'),
          ),
      ],
    );
  }

  Widget _buildAnswerButton(int index, String answerText, bool isCorrect) {
    Color buttonColor = Colors.blue; // Cor padrão

    if (_answered) {
      if (index == _selectedAnswerIndex) {
        // Se a resposta selecionada estiver correta, fica verde. Senão, fica vermelha
        buttonColor = isCorrect ? Colors.green : Colors.red;
      } else if (isCorrect) {
        // A resposta correta fica verde se não foi selecionada
        buttonColor = Colors.green;
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: !_answered ? () => _answerQuestion(index, isCorrect) : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          disabledForegroundColor: buttonColor.withOpacity(0.38),
          disabledBackgroundColor: buttonColor.withOpacity(
              0.12), // Evita que o botão fique cinza quando desativado
        ), // Desativa o botão após a resposta
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildResultScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Quiz concluído!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Sua pontuação: $_score/${_questions.length}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _currentQuestionIndex = 0;
                _score = 0;
                _answered = false;
                _selectedAnswerIndex = -1;
              });
            },
            child: const Text('Reiniciar Quiz'),
          ),
        ],
      ),
    );
  }
}
