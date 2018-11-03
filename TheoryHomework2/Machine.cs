using System;
using System.Collections.Generic;
using System.Linq;

namespace TheoryHomework2
{
    class Machine
    {
        public Dictionary<int, State> States { get; set; } = new Dictionary<int, State>();

        public Stack<char> MachineStatck = new Stack<char>();

        public List<State> ProcessString(string input) {
            var currentState = this.States.First().Value;
            var path = new List<State>() { currentState };
            if (String.IsNullOrEmpty(input))
            {
                input = "S";
            }

            var symbols = input.ToCharArray();
            foreach (var s in symbols) {
                if (s == 'S')
                {
                    currentState = this.States[2];
                    path.Add(currentState);
                    continue;
                }
                processStack(currentState, s);

                if (currentState.Transitions.ContainsKey(s))
                {
                    currentState = this.States[currentState.Transitions[s]];
                    path.Add(currentState);
                }
                else
                {
                    path.Add(new State() { Name = "Fail", IsAcceptance = false});
                    break;
                }
            }
            return path;
        }

        public char[] GetLanguage() {
            var result = new List<char>();
            foreach (var state in this.States) {
                foreach(var c in state.Value.Transitions.Keys){
                    result.Add(c);
                }
            }
            return result.Distinct().ToArray();
        }

        private void processStack(State currentState, char s) {
            if (!currentState.StackTransitions.ContainsKey(s))
            {
                this.MachineStatck.Push('X');
                return;
            }

            var pop = currentState.StackTransitions[s].Key;
            var push = currentState.StackTransitions[s].Value;

            if (!String.IsNullOrWhiteSpace(pop + "") && this.MachineStatck.Any() && this.MachineStatck.Peek() == pop)
            {
                this.MachineStatck.Pop();
            }
            else if (!String.IsNullOrWhiteSpace(pop + "") && !this.MachineStatck.Any()) {
                this.MachineStatck.Push('X');
            }
            else {
                this.MachineStatck.Push(push);
            }
        }
    }
}
