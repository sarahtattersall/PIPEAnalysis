package pipe.reachability.algorithm.sequential;

import pipe.reachability.algorithm.state.StateExplorer;
import pipe.reachability.io.WriterFormatter;
import pipe.reachability.state.State;

import java.io.IOException;
import java.io.ObjectOutputStream;

/**
 * Saves the state transition out to the writer
 */
public class SavingStateExplorer implements StateExplorer {


    /**
     * Form in which to write transitions out to a Writer
     */
    private final WriterFormatter formatter;

    /**
     * Stream to write states to
     */
    private final ObjectOutputStream writer;

    public SavingStateExplorer(WriterFormatter formatter, ObjectOutputStream writer) {
        this.formatter = formatter;
        this.writer = writer;
    }

    /**
     *
     * Tries to write the state transiton to the specified writer.
     * It will not write a transition if previous is null, and this represents no transition
     * into the root of the graph
     *
     * @param previous previous state can take null value to represent root of the graph
     * @param state state to explore
     * @param rate  rate at which the state is entered
     */
    @Override
    public void explore(State previous, State state, double rate) {
        if (previous != null) {
            try {
                formatter.write(previous, state, rate, writer);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
