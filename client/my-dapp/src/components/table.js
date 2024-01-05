import React from 'react';
import '../App.css';
export const TableComponent = ({ data }) => {
  return (
    <table className="styled-table">
      <thead>
        <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Description</th>
          <th>Goal</th>
        </tr>
      </thead>
      <tbody>
        {data.map((item) => (
          <tr key={item.id}>
            <td>{item.id+1}</td>
            <td>{item.name}</td>
            <td>{item.description}</td>
            <td>{item.goal}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default TableComponent;
