import React from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';

export default class App extends React.Component {

  state = { counter: 0 };

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text}>{ this.state.counter } </Text>
        <Button style={styles.text} title="+1" onPress={ () => {
          this.setState({ counter: this.state.counter + 1 });
        }}  />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    fontSize: 50
  }
});
