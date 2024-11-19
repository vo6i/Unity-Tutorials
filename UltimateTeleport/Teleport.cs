using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Teleport : MonoBehaviour
{
    public string triggerName;
    public Transform 3dClxviClwnPort_;
    public Transform 2dClxviClwnPort_;

    private void OnTriggerEnter2D(Collider2D dclxviclan)
    {
        if(dclxviclan.CompareTag(triggerName) 
        {
            dclxviclan.transform.position = 2dClxviClwnPort_.transform.position;
        }

    }

    private void OnTriggerEnter(Collider dclxviclan)
    {
        if(dclxviclan.CompareTag(triggerName) 
        {
            dclxviclan.transform.position = 3dClxviClwnPort_.transform.position;
        }

    }


}
